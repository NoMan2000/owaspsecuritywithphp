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

    public function __construct(stdClass $models, stdClass $order)
    {
        parent::__construct($models);
        $this->model = new EmployeesGroupsOrders($models, $order);
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
    $auth = new Authenticate();
    $errors = [];
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;
    $pdo = new PDOSingleton(PDOSingleton::CORPORATEUSER);
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

    $isAuth = $checkAuth->isAuth();
    $isCorporate = $checkAuth->isCorporate();
    $isGroup = $checkAuth->isGroup();

    $isAuth || $errors[] = "Not authenticated";
    $isGroup || $errors[] = "Not valid group member";
    $isCorporate || $errors[] = "Incorrect user type.";
    isset($_SESSION) || $errors[] = "No customer is available.";

    $order = new stdClass();
    $order->session = $_SESSION;
    $order->groupID = $_SESSION['groupid'];
    $session = $_SESSION;
    if (empty($errors)) {
        $controller = new EmployeeGroupsOrdersController($models, $order);
        $controller->getCustomerValues();
        if ($isAjax) {
            echo json_encode($controller);
        }
        if (!$isAjax) {
            // Do something else
        }
    }
    if (!empty($errors)) {
        $errorRunner->runErrors($errors);
    }
}
