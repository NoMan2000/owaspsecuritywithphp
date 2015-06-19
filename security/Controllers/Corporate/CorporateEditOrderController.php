<?php

namespace security\Controllers\Corporate;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Controllers\Corporate\BaseCorporateController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Corporate\CorporateEditOrder;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\SiteLogger\FullLog;
use \stdClass;

class CorporateEditOrderController extends BaseCorporateController
{
    private $orderID;
    private $orderModel;
    private $orderData;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        $this->orderModel = new CorporateEditOrder($models, $orderData);
    }
    public function updateOrder()
    {
        $this->data = $this->orderModel->updateOrder();
    }
}

if (isset($_POST['submit']) || isset($_GET['submit'])) {
    extract($_POST);
    extract($_GET);
    $auth = new Authenticate();
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;
    $errors = [];
    $logger = new FullLog('Corporate Viewing Orders');
    $logger->serverData();
    $checkAuth = new CheckAuth($logger);
    $isAdmin = $checkAuth->isAdmin();
    $pdo = null;
    if ($isAdmin) {
        $pdo = new PDOSingleton(PDOSingleton::ADMINUSER);
    }
    if (!$isAdmin) {
        $errors[] = "Only an admin can update orders.";
    }
    $errorRunner = new ErrorRunner();
    $orderID = !empty($_SESSION['orderID']) ?
    $auth->cInt($_SESSION['orderID']) : null;
    $csrf = !empty($csrf) ? $csrf : null;
    if (!$csrf || $csrf !== $_SESSION['csrf_token']) {
        $errors[] = "This form does not appear to have originated on our site.";
    }
    // Isset has to be used on these numbers because they can be a Zero.
    $fulfilled = isset($fulfilled) ? $auth->cInt($fulfilled) : null;
    $unfulfilled = isset($unfulfilled) ? $auth->cInt($unfulfilled) : null;
    $isShipped = isset($isShipped) ? $auth->cInt($isShipped) : null;

    $isCorporate = $checkAuth->isCorporate();
    $employeeID = !empty($_SESSION['employeeid']) ? $auth->cInt($_SESSION['employeeid']) : null;

    $employeeID || $errors[] = "No customer id.  You have most likely timed out.  Log out and log back in.";
    $isCorporate || $errors[] = "You are not authenticated as a corporate user.";

    $models = new stdClass();
    $models->pdo = $pdo;
    $models->errorRunner = $errorRunner;
    $models->logger = $logger;

    $orderData = new stdClass();
    $orderData->orderID = $orderID;
    $orderData->fulfilled = $fulfilled;
    $orderData->unfulfilled = $unfulfilled;
    $orderData->isShipped = $isShipped;
    $orderData->session = $_SESSION;
    if (empty($errors)) {
        $controller = new CorporateEditOrderController($models, $orderData);
        $controller->updateOrder();
        if ($isAjax) {
            echo json_encode($controller);
        }
        if (!$isAjax) {
            // Do Something else
        }
    }
    if (!empty($errors)) {
        $errorRunner->runErrors($errors);
    }
}
