<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Controllers\Customers\BaseCustomerController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\ViewOrders;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\SiteLogger\FullLog;
use \stdClass;

class ViewOrdersController extends BaseCustomerController
{
    private $customerID;
    private $orderModel;
    private $orderData;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        $this->orderData = $orderData;
        $this->customerID = $orderData->customerID;
        $this->orderModel = new ViewOrders($models);
    }
    public function viewOrders()
    {
        $this->orders = $this->orderModel->viewOrders($this->customerID);
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

$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Viewing Orders');
$logger->serverData();
$checkAuth = new CheckAuth($logger);
$errors = [];
$isAjax = (isset($_POST['isAjax']) && $auth->isAjax()) ? true : false;

$isCustomer = $checkAuth->isCustomer();
$customerID = !empty($_SESSION['customerid']) ?
$auth->cInt($_SESSION['customerid']) : null;

$customerID || $errors[] = "No customer id.  You have most likely timed out.  Log out and log back in.";
$isCustomer || $errors[] = "You are not authenticated as a customer.";

if (empty($errors) && $isAjax) {
    $models = new stdClass();
    $models->pdo = $pdo;
    $models->errorRunner = $errorRunner;
    $models->logger = $logger;

    $orderData = new stdClass();
    $orderData->customerID = $customerID;

    $controller = new ViewOrdersController($models, $orderData);
    $controller->viewOrders();
    $controller->viewCustomer();
    echo json_encode($controller);
}
