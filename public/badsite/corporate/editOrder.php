<?php
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/header.php";

use \security\Controllers\Corporate\ViewCorporateOrdersController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\BlackLister;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\Router\Router;
use \security\Models\SiteLogger\FullLog;

$router = new Router(__DIR__);
$rootPath = $router->rootPath;
$auth = new Authenticate();
$redis = new RedisSingleton();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Corporate Edit Orders Page');
$checkAuth = new CheckAuth($logger);
$blackList = new BlackLister($redis);
$isCorporate = $checkAuth->isCorporate();

$userType = PDOSingleton::CORPORATEUSER;
if ($checkAuth->isAdmin()) {
    $userType = PDOSingleton::ADMINUSER;
}

$pdo = new PDOSingleton($userType);

$orderID = !empty($_GET['order']) ?
$auth->cInt($_GET['order']) : null;
$employeeID = !empty($_SESSION['employeeid']) ?
$auth->cInt($_SESSION['employeeid']) : null;

if (!$isCorporate) {
    $logger->serverData();
    $logger->addWarning("User attempted to access unauthorized location.");
    $error = rawurlencode('Not an authenticated corporate user.');
    die(header("Location:{$rootPath}goodsite/corporate/corporatelogin.php?errors=$error"));
}
if (!$orderID) {
    $logger->serverData();
    $logger->addWarning("User attempted to access an order without an orderID.");
    $error = rawurlencode('No order was given.');
    die(header("Location:{$rootPath}goodsite/corporate/corporatelogin.php?errors=$error"));
}

$models = new stdClass();
$models->redis = $redis;
$models->errorRunner = $errorRunner;
$models->pdo = $pdo;
$models->logger = $logger;
$models->blackList = $blackList;

$orderData = new stdClass();
$orderData->orderID = $orderID;
$orderData->employeeID = $employeeID;
$orderData->session = $_SESSION;

$ordersController = new ViewCorporateOrdersController($models, $orderData);
$ordersController->setOrders();
$order = $ordersController->getOrders();

$id = $fulfilled = $unfulfilled = $is_shipped = $username =
$address = $email = $phone = $instructions = $city =
$state = $countrycode = $zip = null;
$checked = null;
if (!empty($order)) {
    extract($order);
    $id = intval($id);
    $_SESSION['orderID'] = $id;
    $fulfilled = intval($fulfilled);
    $unfulfilled = intval($unfulfilled);
    $is_shipped = intval($is_shipped);
    if ($is_shipped) {
        $checked = "checked='checked'";
    }
    $instructions = htmlentities($instructions);
}

require_once dirname(dirname(__DIR__)) . '/partials/corporate/editOrderNavbar.php';
require_once dirname(dirname(__DIR__)) . '/partials/corporate/editOrderMain.php';
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/footer.php";
?>
<script type="text/javascript" src='../../js/corporateEditOrder.js'></script>
  </body>
</html>
