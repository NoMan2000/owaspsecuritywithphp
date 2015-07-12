<?php
namespace security\Models;

require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'public/init.php';

use \Redis;
use \security\Interfaces\Seconds;
use \security\Models\CookieEncrypt;
use \security\Traits\SessionState;
use \security\Traits\AbsolutePaths;
use \SessionHandlerInterface;


class RedisSessionHandler implements SessionHandlerInterface, Seconds
{
    use SessionState;
    use AbsolutePaths;
    private $db;
    private $savePath;
    private $restartTimer = SECONDS::HOUR;
    // Encrypting the data like this is most likely unnecessary, but it gives me a chance to show
    // a practical use for the CookieEncyrpt class.

    public function __construct(Redis $redis, $prefix = 'PHPSESSID:', $encryptor = null)
    {
        $this->fullPath();
        ini_set('session.hash_function', 'sha512');
        ini_set('session.hash_bits_per_character', 6);
        //ini_set('session.entropy_file', '/dev/urandom');
        // In php 5.4 and onwards, it will find the default random generator for you.
        ini_set('session.entropy_length', 128);
        // In php 5.5.2 and later, this will prevent unauthorized sessions.
        // By checking a session has been started before accepting a cookie, so an
        // unitialized session cannot be used.  The second check looks at the referer
        // tag from the browser can compares it against a string.  In this case, our server.
        ini_set('session.use_strict_mode', 1);
        ini_set("session.referer_check", $this->rootPath);

        $this->db = $redis;
        $this->prefix = $prefix;
        $encryptor = (isset($encryptor) && $encryptor instanceof CookieEncrypt) ?
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
