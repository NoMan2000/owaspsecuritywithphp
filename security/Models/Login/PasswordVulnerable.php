<?php

namespace security\Models\Login;

require_once dirname(dirname(dirname(__DIR__))) . '/public/init.php';

use \InvalidArgumentException;
use \security\Exceptions\KnownVulnerablePasswordException;
use \security\Exceptions\WeakPasswordException;

class PasswordVulnerable
{
    private $textFile;
    private $arrayFile;
    private $passwords;
    private $password;

    public function __construct($password, $update = false)
    {
        $this->password = $password;
        $this->textFile = __DIR__ . '/badpasswordlist/passwords.txt';
        $this->arrayFile = __DIR__ . '/badpasswordlist/passwords.php';
        if (!file_exists($this->arrayFile) || $update) {
            touch($this->arrayFile);
            $arrayFull = '<?php
                return [';
            $badpasswords = file($this->textFile, FILE_IGNORE_NEW_LINES);
            $len = count($badpasswords);
            $lenMinus = $len - 1;
            for ($i = 0; $i < $len; $i++) {
                if ($i !== $lenMinus) {
                    $arrayFull .= "'{$badpasswords[$i]}',";
                }
                if ($i === $lenMinus) {
                    $arrayFull .= "'{$badpasswords[$i]}'";
                }
            }
            $arrayFull .= '];';
            file_put_contents($this->arrayFile, $arrayFull);
        }
        $this->weakpasswords = require_once $this->arrayFile;
    }

    public function isNotVulnerable()
    {
        if (in_array($this->password, $this->weakpasswords)) {
            throw new KnownVulnerablePasswordException("This password is known to be compromised.");
        }
        $valid = $this->isValid();
        if ($valid) {
            return true;
        }
        if (!$valid) {
            throw new WeakPasswordException("This password is too weak.  It must have at least 8 characters, two upper, two lower, and either two digits or two special characters.");
        }
    }
    // Must be at least 8 characters, two uppercase, two lowercase, two special characters or numbers.
    protected function isValid()
    {
        $passwordValid = preg_match("/(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/", $this->password);
        if ($passwordValid === 0) {
            return false;
        }
        if ($passwordValid === false) {
            throw new InvalidArgumentException("The programmer made an error");
        }
        return true;
    }
}
