<?php

namespace security\Controllers\Corporate;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Controllers\Corporate\BaseCorporateController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Corporate\ViewCorporateOrders;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\SiteLogger\FullLog;
use \stdClass;

class ViewCorporateOrdersController extends BaseCustomerController
{
    private $orderID;
    private $orderModel;
    private $orderData;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        $this->orderData = $orderData;
        $this->customerID = $orderData->orderID;
        $this->orderModel = new ViewCorporateOrders($models);
    }
    public function viewOrders()
    {
        $this->orders = $this->orderModel->viewOrders($this->orderID);
    }
    public function getOrders()
    {
        return $this->orders;
    }
    public function getCustomer()
    {
        return $this->customer;
    }
}

$isAjax = (isset($_POST['isAjax']) && $auth->isAjax()) ? true : false;

if ($isAjax) {
    $pdo = new PDOSingleton(PDOSingleton::ADMINUSER);
    $auth = new Authenticate();
    $errorRunner = new ErrorRunner();
    $logger = new FullLog('Customer Viewing Orders');
    $logger->serverData();
    $checkAuth = new CheckAuth($logger);
    $errors = [];

    $isCustomer = $checkAuth->isCustomer();
    $customerID = !empty($_SESSION['customerid']) ?
        $auth->cInt($_SESSION['customerid']) : null;

    $customerID || $errors[] = "No customer id.  You have most likely timed out.  Log out and log back in.";
    $isCustomer || $errors[] = "You are not authenticated as a customer.";
    $models = new stdClass();
    $models->pdo = $pdo;
    $models->errorRunner = $errorRunner;
    $models->logger = $logger;

    $orderData = new stdClass();
    $orderData->orderID = $customerID;
    if (empty($errors)) {
        $controller = new ViewCorporateOrdersController($models, $orderData);
        $controller->viewOrders();
        $controller->viewCustomer();
        echo json_encode($controller);
    }
}
if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
