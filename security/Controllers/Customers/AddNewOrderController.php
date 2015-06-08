<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Controllers\Customers\BaseCustomerController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\AddNewOrder;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\SiteLogger\FullLog;
use \stdClass;

class AddNewOrderController extends BaseCustomerController
{
    private $customerID;
    private $models;
    private $orderData;
    private $orderModel;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        parent::__construct($models);
        $this->orderModel = new AddNewOrder($models, $orderData);
    }
    public function addOrder()
    {
        $this->data = $this->orderModel->addOrder();
    }
    public function getOrder()
    {
        return $this->data;
    }
}

if (isset($_POST['submit']) || isset($_GET['submit'])) {
    extract($_POST);
    extract($_GET);
    $auth = new Authenticate();
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;

    $errorRunner = new ErrorRunner();
    $logger = new FullLog('Customer Add New Order');
    $logger->serverData();
    $checkAuth = new CheckAuth($logger);
    $errors = [];
    $isValidUser = $checkAuth->isAuth();
    $isAdmin = $checkAuth->isAdmin();
    $isCustomer = $checkAuth->isCustomer();
    // We need admin privileges to assign a group to this.
    // For demo purposes, this assignment will be random,
    // but in a real app, this order would be pending until
    // someone could assign it.
    if ($isAdmin || $isCustomer) {
        $pdo = new PDOSingleton(PDOSingleton::ADMINUSER);
    }
    if (!$isAdmin && !$isCustomer) {
        $errors[] = "Not a privileged account. Cannot perform action.";
    }
    if ($isAdmin) {
        $groupID = $_SESSION['groupid'];
    }
    if (!$isAdmin) {
        $query = "SELECT COUNT(id) as groupCount from groups";
        foreach ($pdo->query($query) as $row) {
            $groupID = mt_rand(1, $row['groupCount']);
        }
    }

    $action = !empty($action) ? $action : null;
    $customerID = !empty($customerID) ? $auth->cInt($customerID) : $_SESSION['customerid'];

    $totalOrdered = !empty($totalOrdered) ?
    $auth->cInt($totalOrdered) : null;
    $csrf = !empty($csrf) ? $csrf : null;

    $action || $errors[] = "No action was specified on this request.";
    $customerID || $errors[] = "No customer id.  You have most likely timed out.  Log out and log back in.";
    $isValidUser || $errors[] = "You are not authenticated as a customer.";
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
    $orderData->groupID = $groupID;
    $orderData->isCustomer = $isCustomer;
    $orderData->isAdmin = $isAdmin;

    if (empty($errors)) {
        $controller = new AddNewOrderController($models, $orderData);
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
