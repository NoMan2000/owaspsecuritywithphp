<?php

namespace security\Models\Authenticator;

require_once(dirname(dirname(dirname(__DIR__))). DIRECTORY_SEPARATOR . 'public/init.php');

class PasswordCheck
{
    public function __construct($password)
    {
        $this->password = $password;
    }
    public function needsNewHash()
    {
        if (password_needs_rehash($this->password, PASSWORD_DEFAULT)) {
            return true;
        }
        return false;
    }
    public function makeHash()
    {
        $this->password = password_hash($this->password, PASSWORD_DEFAULT);
        return $this->password;
    }
}