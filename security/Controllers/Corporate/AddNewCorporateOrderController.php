<?php

namespace security\Controllers\Corporate;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Corporate\AddNewCorporateOrder;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\SiteLogger\FullLog;
use \stdClass;

class AddNewCorporateOrderController extends BaseCorporateController
{
    private $employeeID;
    private $models;
    private $orderData;
    private $orderModel;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        parent::__construct($models);
        $this->orderModel = new AddNewCorporateOrder($models, $orderData);
    }
    public function addOrder()
    {
        $this->data = $this->orderModel->addOrder();
    }
}

if (isset($_POST['submit']) || isset($_GET['submit'])) {
    extract($_POST);
    extract($_GET);
    $auth = new Authenticate();
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;

    $pdo = new PDOSingleton(PDOSingleton::ADMINUSER);
    $errorRunner = new ErrorRunner();
    $logger = new FullLog('Employee Add New Order');
    $logger->serverData();
    $checkAuth = new CheckAuth($logger);
    $errors = [];

    $action = !empty($action) ? $action : null;
    $isAdmin = $checkAuth->isAdmin();
    $customerID = !empty($customerID) ? $auth->cInt($customerID) : null;
    $totalOrdered = !empty($totalOrdered) ? $auth->cInt($totalOrdered) : null;
    $csrf = !empty($csrf) ? $csrf : null;
    $groupID = !empty($_SESSION['groupid']) ? $_SESSION['groupid'] : null;

    $customerID || $errors[] = "No customer id was sent over on the request.";
    $isAdmin || $errors[] = "You are not authenticated as an admin.";
    $totalOrdered || $errors[] = "No orders were sent over.";
    $csrf || $errors[] = "This form does not appear to have originated from our site.";
    $groupID || $errors[] = "Not an authenticated group member.";

    if (!isset($_SESSION['csrf_token']) || $csrf !== $_SESSION['csrf_token']) {
        $errors[] = "This form does not appear to have originated from our site.";
    }
    $models = new stdClass();
    $models->pdo = $pdo;
    $models->errorRunner = $errorRunner;
    $models->logger = $logger;

    $orderData = new stdClass();
    $orderData->action = $action;
    $orderData->totalOrdered = $totalOrdered;
    $orderData->customerID = $customerID;
    $orderData->groupID = $groupID;
    $orderData->isAdmin = $isAdmin;

    if (empty($errors)) {
        $controller = new AddNewCorporateOrderController($models, $orderData);
        $controller->addOrder();
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
