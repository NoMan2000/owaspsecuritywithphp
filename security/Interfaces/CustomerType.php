<?php

namespace security\Interfaces;

require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR. 'vendor/autoload.php');

interface CustomerType
{
    const CUSTOMER = 1;
    const CORPORATE = 2;
    const GROUP = 3;
}
