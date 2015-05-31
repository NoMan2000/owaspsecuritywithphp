<?php

namespace security\Controllers\Corporate;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \stdClass;
use \security\BaseModel;

abstract class BaseCorporateController extends BaseModel
{
    public function __construct(stdClass $models)
    {
        parent::__construct($models);
    }
}
