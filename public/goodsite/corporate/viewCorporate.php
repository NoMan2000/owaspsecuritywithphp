<?php
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/header.php";

use \security\Controllers\Corporate\EmployeeGroupsOrdersController;
use \security\Models\Authenticator\BlackLister;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\Router\Router;
use \security\Models\SiteLogger\FullLog;

$router = new Router(__DIR__);
$rootPath = $router->rootPath;

$redis = new RedisSingleton();
$errorRunner = new ErrorRunner();
$pdo = new PDOSingleton(PDOSingleton::CORPORATEUSER);
$logger = new FullLog('Corporate View Orders Page');
$checkAuth = new CheckAuth($logger);
$blackList = new BlackLister($redis);
$isCorporate = $checkAuth->isCorporate();
$router = new Router(__DIR__);
$rootPath = $router->rootPath;

if (!$isCorporate) {
    $logger->serverData();
    $logger->addWarning("User attempted to access unauthorized location.");
    $error = rawurlencode('Not an authenticated corporate user.');
    die(header("Location:{$rootPath}goodsite/corporate/corporatelogin.php?errors=$error"));
}

$models = new stdClass();
$models->redis = $redis;
$models->errorRunner = $errorRunner;
$models->pdo = $pdo;
$models->logger = $logger;
$models->blackList = $blackList;

$ordersController = new EmployeeGroupsOrdersController($models, $_SESSION);
$ordersController->setOrders();
$orders = $ordersController->getOrders();

$corporateOrders = "";
// $pdo query returns false on fail

$canEdit = isset($_SESSION['is_admin']) ?
$_SESSION['is_admin'] : null;

$addNewOrderButton = $orderButton = null;
if ($canEdit) {
    $ordersController->setCustomerList();
    $customers = $ordersController->getCustomerList();
    $customerList = '';
    foreach ($customers as $customer) {
        $customerList .= "<option value='{$customer['id']}'>{$customer['username']}</option>";
    }
    $orderButton = "<button type='button' class='btn btn-info'
              id='createNewOrder'>
              <span class='glyphicon glyphicon-plus' aria-hidden='true'></span>
              <span id='textForOrder'>Make new order</span>
            </button>";
    $addNewOrderButton = "<button type='submit'
                        class='btn btn-default' name='submitNewOrder' id='submitNewOrder'>
                        Add Order
                        </button>";
}

if (!empty($orders)) {
    foreach ($orders as $order) {
        $id = htmlentities($order['id']);
        $fulfilled = htmlentities($order['fulfilled']);
        $unfulfilled = htmlentities($order['unfulfilled']);
        $allFulfilled = false;
        if ($fulfilled === $unfulfilled || $order['is_shipped']) {
            $allFulfilled = true;
        }
        $encodeID = rawurlencode($order['id']);
        $viewOrder = "<a href='viewOrder.php?order={$encodeID}'>{$id}</a>";
        if ($canEdit) {
            $viewOrder = "<a href='editOrder.php?order={$encodeID}'>{$id}</a>";
        }
        if (!$allFulfilled) {
            $corporateOrders .= "<section id='$id'><div class='col-sm-3'>{$viewOrder}</div>
                                 <div class='col-sm-3'>{$fulfilled}</div>
                                 <div class='col-sm-3'>{$unfulfilled}</div>
                                 <div class='col-sm-3'>";
            if ($canEdit) {
                $corporateOrders .= "<button type='button' class='btn btn-danger'
                                     data-confirm='Delete the order?'
                                     data-id='$id'
                                     data-unfulfilled='$unfulfilled'
                                     >
                                     Delete Order</button>";
            }
            if (!$canEdit) {
                $corporateOrders .= "N/A";
            }
            $corporateOrders .= "</div></section>";
        }
        if ($allFulfilled) {
            $corporateOrders .= "<section id='$id'><div class='col-sm-3 fulfilled'>{$viewOrder}</div>
                                 <div class='col-sm-3 fulfilled'>{$fulfilled}</div>
                                 <div class='col-sm-3 fulfilled'>{$unfulfilled}</div>
                                 <div class='col-sm-3 fulfilled'></div></section>";
        }
    }
}
?>
<?php
require_once dirname(dirname(__DIR__)) . '/partials/corporate/viewCorporateNavbar.php';
require_once dirname(dirname(__DIR__)) . '/partials/corporate/viewCorporateMain.php';
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/footer.php";
?>
<script type="text/javascript" src='<?=$jsPath;?>vieworders.js'></script>
  </body>
</html>
