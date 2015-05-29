<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \stdClass;
use \security\Controllers\Customers\BaseCustomerController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\InitCustomer;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\SiteLogger\FullLog;

class InitCustomerController extends BaseCustomerController
{
    private $models;
    private $session;
    private $initModel;
    
    public function __construct(stdClass $models, array $session)
    {
        parent::__construct($models);
        $this->initModel = new InitCustomer($models, $session);
    }
    public function setCustomerValues()
    {
        $this->initModel->setCustomerValues();
    }
    public function getCustomerValues()
    {
        return $this->initModel->getCustomerValues();
    }
}

$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Initializers');
$logger->serverData();
$checkAuth = new CheckAuth($logger);
$models = new stdClass();
$isAjax = (isset($_POST['isAjax']) && $auth->isAjax()) ? true : false;
$errors = [];

isset($_SESSION) || $errors[] = "No customer is available.";

if ($isAjax && empty($errors)) {
    $models->logger = $logger;
    $models->errorRunner = $errorRunner;
    $models->auth = $auth;
    $models->pdo = $pdo;
    $models->checkAuth = $checkAuth;
    $session = $_SESSION;
    $controller = new InitCustomerController($models, $session);
    $controller->getCustomerValues();
    echo json_encode($controller);
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
