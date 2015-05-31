<?php

namespace security\Controllers\Corporate;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Controllers\Customers\BaseCorpoateController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\AddNewOrder;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\SiteLogger\FullLog;
use \stdClass;

class AddNewOrderController extends BaseCorporateController
{
    private $employeeID;
    private $models;
    private $orderData;
    private $orderModel;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        parent::__construct($models);
        $this->employeeID = $orderData->employeeID;
        $this->totalOrdered = $orderData->totalOrdered;
        $this->orderModel = new AddNewOrder($models);
    }
    public function addOrder()
    {
        $this->data = $this->orderModel->addOrder($this->employeeID, $this->totalOrdered);
    }
}
$isAjax = (isset($_POST['isAjax']) && $auth->isAjax()) ? true : false;

if ($isAjax) {
    $pdo = new PDOSingleton(PDOSingleton::ADMINUSER);
    $auth = new Authenticate();
    $errorRunner = new ErrorRunner();
    $logger = new FullLog('Employee Add New Order');
    $logger->serverData();
    $checkAuth = new CheckAuth($logger);
    $errors = [];

    $action = !empty($_POST['action']) ? $_POST['action'] : null;
    $isCustomer = $checkAuth->isCustomer();
    $customerID = !empty($_SESSION['customerid']) ?
        $auth->cInt($_SESSION['customerid']) : null;
    $totalOrdered = !empty($_POST['totalOrdered']) ?
        $auth->cInt($_POST['totalOrdered']) : null;
    $csrf = !empty($_POST['csrf']) ? $_POST['csrf'] : null;

    $action || $errors[] = "No action was specified on this request.";
    $customerID || $errors[] = "No customer id.  You have most likely timed out.  Log out and log back in.";
    $isCustomer || $errors[] = "You are not authenticated as a customer.";
    $totalOrdered || $errors[] = "No orders were sent over.";
    $csrf || $errors[] = "This form does not appear to have originated from our site.";

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

    if (empty($errors)) {
        $controller = new AddNewOrderController($models, $orderData);
        $controller->addOrder();
        echo json_encode($controller);
    }
}
if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
