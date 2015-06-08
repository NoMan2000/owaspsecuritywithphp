<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Controllers\Customers\BaseCustomerController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\BadRemoveOrder;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\SiteLogger\FullLog;
use \StdClass;

class BadRemoveOrderController extends BaseCustomerController
{
    private $models;
    private $orderData;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        parent::__construct($models);
        $this->order = new BadRemoveOrder($models, $orderData);
    }
    public function removeOrder()
    {
        $this->data = $this->order->removeOrder();
    }
}

if (isset($_POST['submit']) || isset($_GET['submit'])) {
    extract($_POST);
    extract($_GET);
    $auth = new Authenticate();
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;
    $pdo = new PDOSingleton(PDOSingleton::ADMINUSER);
    $errorRunner = new ErrorRunner();
    $logger = new FullLog('Customer Remove Order');
    $logger->serverData();
    $checkAuth = new CheckAuth($logger);
    $errors = [];

    $action = !empty($action) ? $action : null;
    $orderID = !empty($id) ? $auth->cInt($id) : null;
    $customerID = !empty($customerID) ? $auth->cInt($customerID) : null;

    $orderID || $errors[] = "No orderid was specified on this request.";
    $customerID || $errors[] = "No customer id.  You have most likely timed out.  Log out and log back in.";

    $orderData = new stdClass;
    $orderData->action = $action;
    $orderData->orderID = $orderID;
    $orderData->customerID = $customerID;

    $modelObjects = new stdClass;
    $modelObjects->pdo = $pdo;
    $modelObjects->errorRunner = $errorRunner;
    $modelObjects->logger = $logger;
    if (empty($errors)) {
        $controller = new BadRemoveOrderController($modelObjects, $orderData);
        $controller->removeOrder();
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
