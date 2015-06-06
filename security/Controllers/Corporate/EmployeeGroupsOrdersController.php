<?php
namespace security\Controllers\Corporate;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Controllers\Corporate\BaseCorporateController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Corporate\EmployeesGroupsOrders;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\SiteLogger\FullLog;
use \stdClass;

class EmployeeGroupsOrdersController extends BaseCorporateController
{
    private $models;
    private $session;
    private $model;

    public function __construct(stdClass $models, array $session)
    {
        parent::__construct($models);
        $this->model = new EmployeesGroupsOrders($models, $session);
    }
    public function setOrders()
    {
        $this->model->setOrders();
    }
    public function getOrders()
    {
        return $this->model->getOrders();
    }
    public function setCustomerList()
    {
        $this->model->setCustomerList();
    }
    public function getCustomerList()
    {
        return $this->model->getCustomerList();
    }
}

if (isset($_POST['submit']) || isset($_GET['submit'])) {
    extract($_POST);
    extract($_GET);
    $errors = [];
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;
    isset($_SESSION) || $errors[] = "No customer is available.";
    $pdo = new PDOSingleton(PDOSingleton::CORPORATEUSER);
    $auth = new Authenticate();
    $errorRunner = new ErrorRunner();
    $logger = new FullLog('Employee Initializers');
    $logger->serverData();
    $checkAuth = new CheckAuth($logger);
    $models = new stdClass();
    $models->logger = $logger;
    $models->errorRunner = $errorRunner;
    $models->auth = $auth;
    $models->pdo = $pdo;
    $models->checkAuth = $checkAuth;
    $session = $_SESSION;
    if (empty($errors)) {
        $controller = new InitCustomerController($models, $session);
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
