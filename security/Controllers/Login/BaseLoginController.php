<?php

namespace security\Controllers\Login;

include_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \JsonSerializable;

abstract class BaseLoginController implements JsonSerializable
{
    private $data;
    public function jsonSerialize()
    {
        return $this->data;
    }
}
