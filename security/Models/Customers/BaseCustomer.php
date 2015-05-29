<?php

namespace security\Models\Customers;

require_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php');

use \security\BaseModel;
use \stdClass;

abstract class BaseCustomer extends BaseModel
{
    public function __construct(stdClass $models)
    {
        parent::__construct($models);
    }
}
