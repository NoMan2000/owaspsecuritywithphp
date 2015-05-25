<?php 

namespace security\Models\FileUploader;

require_once(dirname(dirname(dirname(__DIR__))). DIRECTORY_SEPARATOR . 'vendor/autoload.php');

// Code modified from David Power's source code.

use \Exception;
use \security\Exceptions\FolderException;
use \LengthException;
use \RecursiveArrayIterator;
use \RecursiveIteratorIterator;
use \finfo;

class FileUploader
{
	protected $destination;
	protected $messages = [];
	protected $maxSize = 51200;
	protected $permittedTypes = [
		'image/jpeg',
		'image/pjpeg',
		'image/gif',
		'image/png',
		'image/webp'
	];
	protected $isJPG = [
	    'image/jpeg',
	    'image/pjpeg'
	];
	protected $tempUploadPath;
	protected $newName;
	protected $files;
	protected $sentManually = false;
	protected $typeCheckingOn = true;
	// This is a blacklisted approach, but this is a really dangerous approach since many more file types 
	// are executable and can be run on the server.
	protected $notTrusted = array('bin', 'cgi', 'exe', 'js', 'pl', 'php', 'py', 'sh');
	protected $suffix = '.upload';
	protected $renameDuplicates;
	
	public function __construct($uploadFolder = '/home/ubuntu/workspace/public/uploads/', $files = null)
	{
		if (!is_dir($uploadFolder) || !is_writable($uploadFolder)) {
			throw new FolderException("$uploadFolder must be a valid, writable folder.");
		}
		if ($uploadFolder[strlen($uploadFolder)-1] != '/') {
			$uploadFolder .= '/';
		}
		$this->tempUploadPath = !empty(ini_get('upload_tmp_dir')) ? ini_get('upload_tmp_dir') : sys_get_temp_dir();
		$this->destination = $uploadFolder;
		
		if (!is_null($files) && is_array($files)) {
			$this->files = $files;
			$this->sentManually = true;
		} elseif (isset($_FILES) && !empty($_FILES['image'])) {
			$this->files = $_FILES;
		} elseif (isset($_FILES) && !empty($_FILES['filename'])) {
			$this->files = $_FILES;
		}  else {
			throw new LengthException("Neither the manual files nor the autoloaded files were set correctly.");
		}
	}
	public function setNotTrusted(array $types = []) 
	{
		$this->notTrusted = $types;
	}
	
	public function setMaxSize($bytes)
	{
		$serverMax = self::convertToBytes(ini_get('upload_max_filesize'));
		if ($bytes > $serverMax) {
			throw new FolderException('Maximum size cannot exceed server limit for individual files: ' .
	self::convertFromBytes($serverMax));
		}
		if (is_numeric($bytes) && $bytes > 0) {
			$this->maxSize = $bytes;
		}
	}
	
	public static function convertToBytes($val)
	{
		$val = trim($val);
		$last = strtolower($val[strlen($val)-1]);
		if (in_array($last, array('g', 'G', 'm','M','k','K'))){
			switch ($last) {
			    // Using fallthrough to calculate the values.
				case 'g' ||'G':
					$val *= 1024;
				case 'm' || 'M':
					$val *= 1024;
				case 'k' || 'K':
					$val *= 1024;
			}
		}
		return $val;
	}
	
	public static function convertFromBytes($bytes)
	{
		$bytes /= 1024;
		if ($bytes > 1024) {
			return number_format($bytes/1024, 1) . ' MB';
		} 
		return number_format($bytes, 1) . ' KB';
	}
	
	public function allowAllTypes($suffix = null)
	{
		$this->typeCheckingOn = false;
		if (!is_null($suffix)) {
			if (strpos($suffix, '.') === 0 || $suffix == '') {
				$this->suffix = $suffix;
			} else {
				$this->suffix = ".$suffix";
			}
		}
	}
	
	public function upload($renameDuplicates = true)
	{
		$this->renameDuplicates = $renameDuplicates;
		
		$uploaded = current($this->files);
		if (is_array($uploaded['name'])) {
			foreach ($uploaded['name'] as $key => $value) {
				$currentFile['name'] = $uploaded['name'][$key];
				$currentFile['type'] = $uploaded['type'][$key];
				$currentFile['tmp_name'] = $uploaded['tmp_name'][$key];
				$currentFile['error'] = $uploaded['error'][$key];
				$currentFile['size'] = $uploaded['size'][$key];
				if ($this->checkFile($currentFile)) {
					$this->moveFile($currentFile);
				}
			}
		} 
		if (is_array($this->files) && $this->sentManually) {
			$files = $this->files;
			foreach (array_keys($files) as $keys) {
				foreach ($files[$keys] as $innerKey => $innerValue) {
					$currentFile[$innerKey] = $innerValue;
				}
				if ($this->checkFile($currentFile)) {
					$this->moveFile($currentFile);
            	}
            }
		}
		
		if (isset($uploaded['name']) && !is_array($uploaded['name']) && !$this->sentManually) {
			if ($this->checkFile($uploaded)) {
				$this->moveFile($uploaded);
			}
		}
		
	}
	
	public function getMessages()
	{
		return $this->messages;
	}
	
	protected function checkFile($file)
	{
		if ($file['error'] != 0) {
			$this->getErrorMessage($file);
			return false;
		}
		if (!$this->checkSize($file)) {
			return false;
		}
		if ($this->typeCheckingOn) {
		    if (!$this->checkType($file)) {
			    return false;
			}
		}
		$this->checkName($file);
		return true;
	}
	
	protected function getErrorMessage($file)
	{
		switch($file['error']) {
			case 1:
			case 2:
				$this->messages[] = $file['name'] . ' is too big: (max: ' . 
				self::convertFromBytes($this->maxSize) . ').';
				break;
			case 3:
				$this->messages[] = $file['name'] . ' was only partially uploaded.';
				break;
			case 4:
				$this->messages[] = 'No file submitted.';
				break;
			default:
				$this->messages[] = 'Sorry, there was a problem uploading ' . $file['name'];
				break;
		}
	}
	
	protected function checkSize($file)
	{
		if ($file['size'] == 0) {
			$this->messages[] = $file['name'] . ' is empty.';
			return false;
		} 
		if ($file['size'] > $this->maxSize) {
			$this->messages[] = $file['name'] . ' exceeds the maximum size for a file ('
					. self::convertFromBytes($this->maxSize) . ').';
			return false;
		} 
		return true;
	}
	
	protected function checkType($file) 
	{
	    // http://blog.sucuri.net/2013/07/malware-hidden-inside-jpg-exif-headers.html
	    // Exif injection attack prevention.
		$finfo = new finfo(FILEINFO_MIME_TYPE);
		$mime_type = $finfo->buffer(file_get_contents($file['tmp_name']));
		// MIME types can be spoofed, the finfo check will perform a more thorough check than
		// what is sent across by the browser.
		
		if (in_array($file['type'], $this->permittedTypes) && in_array($mime_type, $this->permittedTypes)) {
		    return true;
		} 
		$this->messages[] = $file['name'] . $file['type'] . ' is not permitted type of file.';
		return false;
	}
	
	protected function checkName($file)
	{
		$this->newName = null;
		$nospaces = str_replace(' ', '_', $file['name']);
		if ($nospaces != $file['name']) {
			$this->newName = $nospaces;
		}
		$nameparts = pathinfo($nospaces);
		$extension = isset($nameparts['extension']) ? $nameparts['extension'] : '';
		if (!$this->typeCheckingOn && !empty($this->suffix)) {
			if (in_array($extension, $this->notTrusted) || empty($extension)) {
				$this->newName = $nospaces . $this->suffix;
			}
		}
		if ($this->renameDuplicates) {
			$name = isset($this->newName) ? $this->newName : $file['name'];
			$existing = scandir($this->destination);
			if (in_array($name, $existing)) {
				$i = 1;
				do {
					$this->newName = $nameparts['filename'] . '_' . $i++;
					if (!empty($extension)) {
						$this->newName .= ".$extension";
					}
					if (in_array($extension, $this->notTrusted)) {
						$this->newName .= $this->suffix;
					}
				} while (in_array($this->newName, $existing));
			}
		}
	}
	
	protected function moveFile($file)
	{
		$filename = isset($this->newName) ? $this->newName : $file['name'];
		$success = move_uploaded_file($file['tmp_name'], $this->destination . $filename);
		if (in_array($file['type'], $this->isJPG)) {
	        // using this function will clone the picture and throw away any exif data inside it.
	        // There are other options if you want to keep the data, 
	        // like running an automatic virus scan when you upload a file
	        // or processing the exif data through a filter and then re-encoding it to the file.
	        $img = imagecreatefromjpeg($this->destination . $filename);
            imagejpeg($img, $this->destination . $filename, 100);
            imagedestroy($img);
	    }
		
		if ($success) {
			$result = $file['name'] . ' was uploaded successfully';
			$name = $file['name'];
			if (!is_null($this->newName)) {
				$result .= ', and was renamed ' . $this->newName;
				$name = $this->newName;
			}
			// Demo only, remove this or rewrite this for a real server.
			$convertDestination = str_replace('/home/ubuntu/workspace/public', $_SERVER['SERVER_NAME'], $this->destination); 
			$result .= " and sent to <a href='//{$convertDestination}{$name}'>{$convertDestination}{$name}</a>.";
			$this->messages[] = $result;
		} 
		if (!$success) {
			$this->messages[] = 'Could not upload ' . $file['name'];
		}
	}
}