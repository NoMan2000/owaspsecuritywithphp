<?php

namespace security\Models;

class PasswordGenerator 
{
    public function generateRandomPassword($length = 10, $enc = 6)
    {
        $randomPass = bin2hex(openssl_random_pseudo_bytes($enc));
        $newPassword = substr(hash('ripemd320', $randomPass), 0, $length);
        return $newPassword;
    }
}