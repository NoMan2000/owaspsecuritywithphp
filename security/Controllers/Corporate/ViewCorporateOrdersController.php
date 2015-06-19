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

class ViewCorporateOrdersController extends BaseCorporateController
{
    private $orderID;
    private $orderModel;
    private $orderData;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        $this->orderModel = new ViewCorporateOrders($models, $orderData);
    }
    public function setOrders()
    {
        $this->orders = $this->orderModel->setOrders();
    }
    public function getOrders()
    {
        return $this->orders;
    }
}

if (isset($_POST['submit']) || isset($_GET['submit'])) {
    extract($_POST);
    extract($_GET);
    $auth = new Authenticate();
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;

    $pdo = new PDOSingleton(PDOSingleton::ADMINUSER);
    $errorRunner = new ErrorRunner();
    $logger = new FullLog('Corporate Viewing Orders');
    $logger->serverData();
    $checkAuth = new CheckAuth($logger);
    $errors = [];
    $orderID = !empty($orderid) ? $auth->cInt($orderid) : null;

    $isCorporate = $checkAuth->isCorporate();
    $employeeID = !empty($_SESSION['employeeid']) ?
    $auth->cInt($_SESSION['employeeid']) : null;

    $employeeID || $errors[] = "No customer id.  You have most likely timed out.  Log out and log back in.";
    $isCorporate || $errors[] = "You are not authenticated as a corporate user.";

    $models = new stdClass();
    $models->pdo = $pdo;
    $models->errorRunner = $errorRunner;
    $models->logger = $logger;

    $orderData = new stdClass();
    $orderData->orderID = $orderID;
    $orderData->employeeID = $employeeID;
    $orderData->session = $_SESSION;
    if (empty($errors)) {
        $controller = new ViewCorporateOrdersController($models, $orderData);
        $controller->setOrders();
        $controller->getOrders();
        if ($isAjax) {
            echo json_encode($controller);
        }
        if (!$isAjax) {
            // do Something else
        }
    }
    if (!empty($errors)) {
        $errorRunner->runErrors($errors);
    }
}
