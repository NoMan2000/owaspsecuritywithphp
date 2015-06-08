<?php

namespace security\Models\Authenticator;

require_once dirname(dirname(dirname(__DIR__))) . '/public/init.php';

// Note this is an unsophisticated library for validation and sanitation.
// More sophisticated libraries will be discussed and are in the composer.json
// file.

class Authenticate
{
    public function vEmail($email)
    {
        $isValid = filter_var($email, FILTER_VALIDATE_EMAIL);
        if ($isValid) {
            $email = filter_var($email, FILTER_SANITIZE_EMAIL);
            return $email;
        }
        return false;
    }
    public function cleanString($string)
    {
        return (trim(filter_var($string, FILTER_SANITIZE_STRING)));
    }

    public function vPhone($phone = null, $isInternational = false)
    {
        $phone = !empty($phone) ? $this->cInt($phone) : null;
        $phoneLen = strlen($phone);
        if ($phone && !$isInternational) {
            $phone = ($phoneLen === 10 || $phoneLen === 11) ? $phone : null;
        }
        if ($phone && $isInternational) {
            // You need a more sophisticated framework for this sort of check.
            // See https://github.com/giggsey/libphonenumber-for-php
        }
        return $phone;
    }

    public function cInt($value)
    {
        $value = preg_replace("/[^\d]+(?<!^[+-])/", '', $value);
        $value = filter_var($value, FILTER_SANITIZE_NUMBER_INT);
        if ($value <= PHP_INT_MAX) {
            return intval($value);
        }
        return $value;
    }

    public function filledAndSet($v)
    {
        if (is_array($v)) {
            $this->isArrayAllFilled($v);
        }

        if (!isset($v) || is_null($v)) {
            return false;
        }
        if (is_bool($v)) {
            return true;
        }
        if (is_numeric($v)) {
            return true;
        }
        $v = trim($v);
        // Trim converts a value to a string, so save that check for last.
        if (is_string($v) && !empty($v)) {
            return true;
        }
        return false;
    }

    // Do not rely on this alone.  In an Ajax-based framework where a php file is loaded in dynamically, the
    // request will be considered ajax even if it is being statically generated.
    public function isAjax()
    {
        $isAjax = (isset($_SERVER['HTTP_X_REQUESTED_WITH']) and
            strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest') ?
        true : false;
        return $isAjax;
    }

    public function isArrayAllFilled(array $v)
    {
        if (empty($v) || !isset($v)) {
            return false;
        }
        foreach ($v as $key => $value) {
            $$key = trim($value);
            if (empty($$key)) {
                return false;
            }
        }
        return true;
        /* If the array is set and no values are empty, return true. */
    }
}
