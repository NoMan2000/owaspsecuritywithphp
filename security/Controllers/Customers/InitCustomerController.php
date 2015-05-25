<?php

namespace security\Controllers\Customers;

require_once(dirname(dirname(dirname(__DIR__))). DIRECTORY_SEPARATOR . 'public/init.php');

use \security\Models\PDOSingleton;
use \PDO;
use \security\Models\Authenticator\Authenticate;
use \security\Models\ErrorRunner;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\SiteLogger\FullLog;
use \security\Models\Customers\InitCustomer;

$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Edit Form Initializers');
$logger->serverData();
$checkAuth = new CheckAuth($logger);
$errors = [];

class InitCustomerController
{
    private $customerData;
    public function __construct(PDO $pdo) 
    {
        $this->initModel = new InitCustomer($pdo, $_SESSION);
    }
    public function getArrayValues()
    {
        return $this->initModel->getCustomerValues();
    }
}