<?php
namespace security\Models;

require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'vendor/autoload.php');

use \Redis;
use \SessionHandlerInterface;
use \security\Interfaces\Seconds;
use \security\Traits\SessionState;
use \security\Models\CookieEncrypt;

class RedisSessionHandler implements SessionHandlerInterface, Seconds
{
    use SessionState;
    private $db;
    private $savePath;
    private $restartTimer = SECONDS::HOUR;
    // Encrypting the data like this is most likely unnecessary, but it gives me a chance to show
    // a practical use for the CookieEncyrpt class.
    
    public function __construct(Redis $redis, $prefix = 'PHPREDIS_SESSION:', $encryptor = null)
    {
        ini_set('session.hash_function', 'sha512');
        ini_set('session.hash_bits_per_character', 6);
        //ini_set('session.entropy_file', '/dev/urandom');
        // In php 5.4 and onwards, it will find the default random generator for you.
        ini_set('session.entropy_length', 128);
        $this->db = $redis;
        $this->prefix = $prefix;
        $encryptor = (isset($encryptor) && is_object($encryptor) && $encryptor instanceof CookieEncrypt) ? 
            $encryptor : $this->setDefaultCookieEncryptor();
        $this->maxlifetime = $this->restartTimer;
        $this->setCookieEncrypt($encryptor);
    }
    protected function setDefaultCookieEncryptor()
    {
        return (new CookieEncrypt());
    }
    public function setCookieEncrypt($encryptor)
    {
        $this->encryptor = $encryptor;
    }
    public function open($savePath, $sessionName)
    {
    }
    public function close()
    {
        $this->db = null;
        unset($this->db);
    }
    public function read($id)
    {
        $id = $this->prefix . $id;
        $sessData = $this->db->get($id);
        if ($sessData) {
            // This prevents it from trying to decrypt nothing, which will throw a warning error.
            $sessData = $this->encryptor->decryptString($sessData);
        }
        $this->db->expire($id, $this->maxlifetime);
        return $sessData;
    }
    public function write($id, $data)
    {
        $id = $this->prefix . $id;
        $data = $this->encryptor->encString($data);
        $this->db->set($id, $data);
        $this->db->expire($id, $this->maxlifetime);
    }
    public function destroy($id)
    {
        $this->db->del($this->prefix . $id);
    }
    public function gc($maxlifetime)
    {
    }
}
