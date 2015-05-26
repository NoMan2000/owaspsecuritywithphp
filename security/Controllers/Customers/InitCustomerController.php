<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\InitCustomer;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Controllers\Customers\BaseCustomerController;
use \security\Models\SiteLogger\FullLog;

class InitCustomerController extends BaseCustomerController
{
    private $customerData;
    public function __construct(stdClass $models)
    {
        parent::__construct($models);
        parent::constructObjects();
        $this->initModel = new InitCustomer($models->pdo, $_SESSION);
    }
    public function getArrayValues()
    {
        return $this->initModel->getCustomerValues();
    }
}

$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Edit Form Initializers');
$logger->serverData();
$checkAuth = new CheckAuth($logger);
$models = new stdClass();

$models->logger = $logger;
$models->errorRunner = $errorRunner;
$models->auth = $auth;
$models->pdo = $pdo;
$models->checkAuth = $checkAuth;

$errors = [];
