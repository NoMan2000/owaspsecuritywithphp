<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \JsonSerializable;
use \stdClass;
use \security\BaseModel;

abstract class BaseCustomerController extends BaseModel
{
    public function __construct(stdClass $models)
    {
        parent::__construct($models);
    }
}
