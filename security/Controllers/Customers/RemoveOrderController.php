<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Controllers\Customers\BaseCustomerController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\RemoveOrder;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\SiteLogger\FullLog;
use \StdClass;

class RemoveOrderController extends BaseCustomerController
{
    private $customerID;
    private $orderID;
    private $action;
    private $data;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        $this->orderData = $orderData;
        $this->order = new RemoveOrder($models);
    }
    public function removeOrder()
    {
        $this->data = $this->order->removeOrder(
            $this->orderData->customerID,
            $this->orderData->orderID
        );
    }
    public function jsonSerialize()
    {
        return $this->data;
    }
}

$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Remove Order');
$logger->serverData();
$checkAuth = new CheckAuth($logger);
$errors = [];

$action = !empty($_POST['action']) ?
$_POST['action'] : null;
$orderID = !empty($_POST['id']) ? $auth->cInt($_POST['id']) : null;
$isCustomer = $checkAuth->isCustomer();
$customerID = !empty($_SESSION['customerid']) ?
$auth->cInt($_SESSION['customerid']) : null;

$action || $errors[] = "No action was specified on this request.";
$orderID || $errors[] = "No orderid was specified on this request.";
$customerID || $errors[] = "No customer id.  You have most likely timed out.  Log out and log back in.";
$isCustomer || $errors[] = "You are not authenticated as a customer.";

$csrf = !empty($_POST['csrf']) ? $_POST['csrf'] : null;
if (!isset($_SESSION['csrf_token']) || $_SESSION['csrf_token'] !== $csrf) {
    $errors[] = "This form does not appear to have originated from our site.";
}

if (empty($errors)) {
    $orderData = new stdClass;
    $orderData->action = $action;
    $orderData->orderID = $orderID;
    $orderData->customerID = $customerID;

    $modelObjects = new stdClass;
    $modelObjects->pdo = $pdo;
    $modelObjects->errorRunner = $errorRunner;
    $modelObjects->logger = $logger;

    $controller = new RemoveOrderController($customerData, $modelObjects);
    $controller->removeOrder();
    if ($isAjax) {
        echo json_encode($controller);
    }
}
