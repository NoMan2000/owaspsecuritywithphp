<?php

namespace security\Models;

require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'vendor/autoload.php';

use \security\Exceptions\FolderException;

// See:  https://github.com/CodeReaper/unsealed-secrets/blob/master/php/encode.php
// Code modified from:  http://codereaper.com/blog/2014/asymmetric-encryption-in-php/

// This code really only works in a database system as you have to store
// the items in a database and return them all when decrypting it.

class SSLEncryptor
{
    private $folder;
    private $privateKey;
    private $publicKey;
    private $message;
    private $decrypt;
    public function __construct($folder = null, $passphrase = '')
    {
        $this->folder = $folder ? $folder : __DIR__ . '/confKeys';
        if (!is_dir($this->folder)) {
            mkdir($this->folder, 0775);
        }
        if (!is_dir($this->folder)) {
            throw new FolderException("Cannot make or find a valid folder directory.");
        }
        if (!file_exists("{$this->folder}/public.pem")) {
            // create the private key private.key
            exec("openssl genrsa -out {$this->folder}/private.key 4096");
            // create the public key public.pem
            exec("openssl rsa -in {$this->folder}/private.key -outform PEM -pubout -out {$this->folder}/public.pem");
        }
        if (!file_exists("{$this->folder}/public.pem")) {
            throw new Exception("Could not find the public key file.");
        }
        $this->privateKey = openssl_pkey_get_private(file_get_contents("{$this->folder}/private.key"), $passphrase);
        $this->publicKey = openssl_pkey_get_public(file_get_contents("{$this->folder}/public.pem"));
    }

    public function encryptMessage($message)
    {
        $cipher = $e = null; // These are passed by reference, so they are changed after the seal
        openssl_seal($message, $cipher, $e, [$this->publicKey]);
        $this->sealedData = base64_encode($cipher);
        $this->envelope = base64_encode($e[0]);
        // These must either be stored in a database or in a file somewhere.
    }
    public function decryptMessage()
    {
        $input = base64_decode($this->sealedData);
        $einput = base64_decode($this->envelope);

        $message = null; // Also passed by reference.
        openssl_open($input, $message, $einput, $this->privateKey);
        $this->decrypt = $message;
    }
    public function getDecrypt()
    {
        return $this->decrypt;
    }
}

// $enc = new SSLEncryptor();
// $message = $enc->encryptMessage("This is an encrypted message.");
// echo $message;
// $enc->decryptMessage();
// $decrypt = $enc->getDecrypt();
// echo $decrypt;
