<?php

namespace security\Controllers\Corporate;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Controllers\Corporate\BaseCorporateController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Corporate\RemoveOrderCorporate;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\SiteLogger\FullLog;
use \StdClass;

class RemoveOrderCorporateController extends BaseCorporateController
{
    private $customerID;
    private $orderID;
    private $order;
    private $models;
    private $orderData;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        parent::__construct($models);
        $this->order = new RemoveOrderCorporate($models, $orderData);
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
    $logger = new FullLog('Corporate Remove Order');
    $logger->serverData();
    $checkAuth = new CheckAuth($logger);
    $errors = [];

    $orderID = !empty($id) ? $auth->cInt($id) : null;
    $isAdmin = $checkAuth->isAdmin();
    $groupID = !empty($_SESSION['groupid']) ? $auth->cInt($_SESSION['groupid']) : null;

    $orderID || $errors[] = "No orderid was specified on this request.";
    $groupID || $errors[] = "No group id.  You have most likely timed out.  Log out and log back in.";
    $isAdmin || $errors[] = "You are not an admin and cannot perform this action.";

    $csrf = !empty($csrf) ? $csrf : null;
    if (!isset($_SESSION['csrf_token']) || $_SESSION['csrf_token'] !== $csrf) {
        $errors[] = "This form does not appear to have originated from our site.";
    }
    $orderData = new stdClass;
    $orderData->action = $action;
    $orderData->orderID = $orderID;
    $orderData->groupID = $groupID;

    $modelObjects = new stdClass;
    $modelObjects->pdo = $pdo;
    $modelObjects->errorRunner = $errorRunner;
    $modelObjects->logger = $logger;
    if (empty($errors)) {
        $controller = new RemoveOrderCorporateController($modelObjects, $orderData);
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
