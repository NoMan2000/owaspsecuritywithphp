<?php
namespace security\Models;

require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'vendor/autoload.php');

// Encrypted cookie functions
// requires mcrypt: http://php.net/manual/en/book.mcrypt.php

class CookieEncrypt
{
    const ENCRYPTION = 'abc234098979asjaa234232355';

    public function __construct()
    {
        $this->salt = self::ENCRYPTION;
        $this->cipher_type = MCRYPT_RIJNDAEL_256;
        $this->cipher_mode = MCRYPT_MODE_CBC;
        $this->iv_size = mcrypt_get_iv_size($this->cipher_type, $this->cipher_mode);
    }
    
    protected function encryptRawString($string)
    {
        // Configuration (must match decryption)
        // Using initialization vector adds more security
        $iv =  mcrypt_create_iv($this->iv_size, MCRYPT_DEV_URANDOM);
        $encrypted_string = mcrypt_encrypt($this->cipher_type, $this->salt, $string, $this->cipher_mode, $iv);
        // Return initialization vector + encrypted string
        // We'll need the $iv when decoding.
        return $iv . $encrypted_string;
    }
    protected function decryptRawString($iv_with_string)
    {
        // Extract the initialization vector from the encrypted string.
        // The $iv comes before encrypted string and has fixed size.
        $iv = substr($iv_with_string, 0, $this->iv_size);
        $encrypted_string = substr($iv_with_string, $this->iv_size);
        $string = mcrypt_decrypt($this->cipher_type, $this->salt, $encrypted_string, $this->cipher_mode, $iv);
        return $string;
    }
    // Encode after encryption to ensure encrypted characters are savable
    public function encString($string)
    {
        return base64_encode($this->encryptRawString($string));
    }
    // Decode before decryption
    public function decryptString($string)
    {
        return $this->decryptRawString(base64_decode($string));
    }
}
// Uncomment to show usage.
// $encryptor = new CookieEncrypt();
// $encryptedShell = $encryptor->encString("This is supposed to be encrypted.");
// echo $encryptedShell . "<br/>";
// $decryptedShell = $encryptor->decryptString($encryptedShell);
// echo $decryptedShell;