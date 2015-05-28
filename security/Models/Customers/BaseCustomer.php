<?php

namespace security\Models\Customers;

require_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php');

use \security\Traits\IsDevelopment;
use \security\Controllers\Customers\BaseCustomerController;
use \stdClass;

class BaseCustomer extends BaseCustomerController
{
    public function __construct(stdClass $models)
    {
        parent::__construct($models);
    }
}
