<?php

namespace security\Models;

class PasswordGenerator
{
    const MAXLENGTH = 128;
    // Max length for the whirlpool protocol.
    public function generateRandomPassword($length = 10, $enc = 6)
    {
        if ($length === 0 || is_nan($length)) {
            $length = self::MAXLENGTH;
        }
        if ($enc === 0 || is_nan($enc)) {
            $enc = 30;
        }
        $loops = floor($length / self::MAXLENGTH);
        $remainder = $length % self::MAXLENGTH;
        $newPassword = '';
        for ($i = 0; $i <= $loops; $i++) {
            if ($i < $loops) {
                $length = self::MAXLENGTH;
            } else {
                $length = $remainder;
            }
            $randomPass = bin2hex(openssl_random_pseudo_bytes($enc));
            $newPassword .= substr(hash('whirlpool', $randomPass), 0, $length);
        }
        return $newPassword;
    }
}
