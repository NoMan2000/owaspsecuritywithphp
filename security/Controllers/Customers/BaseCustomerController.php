<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \JsonSerializable;
use \security\Traits\IsDevelopment;

abstract class BaseCustomerController implements JsonSerializable
{
    use IsDevelopment;
    private $data;

    public function jsonSerialize()
    {
        return $this->data;
    }
}
