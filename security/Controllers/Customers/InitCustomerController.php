<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Controllers\Customers\BaseCustomerController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\InitCustomer;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\SiteLogger\FullLog;
use \stdClass;

class InitCustomerController extends BaseCustomerController
{
    private $models;
    private $session;
    private $initModel;

    public function __construct(stdClass $models, stdClass $customerData)
    {
        parent::__construct($models);
        $this->initModel = new InitCustomer($models, $customerData);
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

if (isset($_POST['submit']) || isset($_GET['submit'])) {
    extract($_POST);
    extract($_GET);
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;
    isset($_SESSION) || $errors[] = "No customer is available.";
    $pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
    $auth = new Authenticate();
    $errorRunner = new ErrorRunner();
    $logger = new FullLog('Customer Initializers');
    $logger->serverData();
    $checkAuth = new CheckAuth($logger);
    $models = new stdClass();
    $customerData = new stdClass();
    $errors = [];
    $customerData->session = $_SESSION;

    $models->logger = $logger;
    $models->errorRunner = $errorRunner;
    $models->auth = $auth;
    $models->pdo = $pdo;
    $models->checkAuth = $checkAuth;
    if (empty($errors)) {
        $controller = new InitCustomerController($models, $customerData);
        $controller->getCustomerValues();
        if ($isAjax) {
            echo json_encode($controller);
        }
        if (!$isAjax) {
            // Do something else
        }
    }
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
