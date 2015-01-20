<?php

namespace security\Interfaces;

require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR. 'vendor/autoload.php');

interface Seconds 
{
    const MINUTE = 60;
    const HOUR = 3600;
    const DAY = 86400; 
} 