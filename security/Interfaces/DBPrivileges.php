<?php

namespace security\Interfaces;

require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR. 'vendor/autoload.php');

interface DBPrivileges
{
    const GLOBALUSER = 1;
    const ADMINUSER = 2;
    const CORPORATEUSER = 3;
    const CUSTOMERUSER = 4;
}
