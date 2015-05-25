<?php

namespace security\Models;

class ErrorRunner 
{
    public function runErrors(array $errors)
    {
        if (!empty($errors)) {
            header("HTTP/1.0 501 Not Implemented");
            $errorIterator = new \RecursiveArrayIterator($errors);
            foreach (new \RecursiveIteratorIterator($errorIterator) as $error) {
                echo $error . "<br/>";
            }
            die();
        } // End if !empty errors
    }
}