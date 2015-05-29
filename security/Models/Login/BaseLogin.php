<?php

namespace security\Models\Login;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \stdClass;
use \security\BaseModel;

abstract class BaseLogin extends BaseModel
{
    public function __construct(stdClass $models)
    {
        parent::__construct($models);
    }
}
