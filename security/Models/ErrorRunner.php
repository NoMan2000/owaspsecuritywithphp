<?php

namespace security\Models;

require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'public/init.php';

use \RecursiveArrayIterator;
use \RecursiveIteratorIterator;

class ErrorRunner
{
    public function runErrors(array $errors)
    {
        if (!empty($errors)) {
            header("HTTP/1.0 501 Not Implemented");
            $errorIterator = new RecursiveArrayIterator($errors);
            foreach (new RecursiveIteratorIterator($errorIterator) as $error) {
                echo $error . "<br/>";
            }
            die();
        }
    }
}
