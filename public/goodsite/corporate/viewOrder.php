<?php
require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR ."partials/header.php");

use \security\Models\Authenticator\CheckAuth;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\SiteLogger\FullLog;
use \security\Models\RedisSingleton;
use \security\Models\Router\Router;
use \security\Models\PDOSingleton;
use \security\Controllers\Corporate\ViewCorporateOrdersController;

$router = new Router(__DIR__);
$rootPath = $router->rootPath;
$auth = new Authenticate();
$redis = new RedisSingleton();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Corporate View Page');
$checkAuth = new CheckAuth($logger);
$blackList = new BlackLister($redis);
$isCorporate = $checkAuth->isCorporate();

$router = new Router(__DIR__);
$rootPath = $router->rootPath;
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

$corporateOrders = "";
if (!empty($order)) {
    extract($order);
    $id = intval($id);
    $fulfilled = intval($fulfilled);
    $unfulfilled = intval($unfulfilled);
    $is_shipped = intval($is_shipped);
    $username = htmlentities($username);
    $address = htmlentities($address);
    $email = htmlentities($email);
    $phone = htmlentities($phone);
    $instructions = htmlentities($instructions);
    $city = htmlentities($city);
    $state = htmlentities($state);
    $countrycode = htmlentities($countrycode);
    $zip = htmlentities($zip);

    $corporateOrders = "<section id='$id'>
        <div class='col-sm-3 col-sm-offset-1'>Order ID:</div><div class='col-sm-8'>{$id}</div>
        <div class='col-sm-3 col-sm-offset-1'>Fulfilled:</div><div class='col-sm-8'>{$fulfilled}</div>
        <div class='col-sm-3 col-sm-offset-1'>Unfulfilled:</div><div class='col-sm-8'>{$unfulfilled}</div>
        <div class='col-sm-3 col-sm-offset-1'>Is Shipped:</div><div class='col-sm-8'>{$is_shipped}</div>
        <div class='col-sm-3 col-sm-offset-1'>Username:</div><div class='col-sm-8'>{$username}</div>
        <div class='col-sm-3 col-sm-offset-1'>Address:</div><div class='col-sm-8'>{$unfulfilled}</div>
        <div class='col-sm-3 col-sm-offset-1'>Email:</div><div class='col-sm-8'>{$email}</div>
        <div class='col-sm-3 col-sm-offset-1'>Phone:</div><div class='col-sm-8'>{$phone}</div>
        <div class='col-sm-3 col-sm-offset-1'>City:</div><div class='col-sm-8'>{$city}</div>
        <div class='col-sm-3 col-sm-offset-1'>State:</div><div class='col-sm-8'>{$state}</div>
        <div class='col-sm-3 col-sm-offset-1'>CountryCode:</div><div class='col-sm-8'>{$countrycode}</div>
        <div class='col-sm-3 col-sm-offset-1'>Zip:</div><div class='col-sm-8'>{$zip}</div>
        <div class='col-sm-3 col-sm-offset-1'>Instructions:</div><div class='col-sm-8'>{$instructions}</div>
     </section>";
}

?>
<section class="container-fluid row">
    <div id='content' class='clearfix col-xs-12
      col-sm-offset-2 col-md-offset-2 col-lg-offset-2
      col-sm-8 col-md-8 col-lg-8'>
        <div id='successHolder' class="alert alert-success" role="alert" style='display:none;'>
            <div id='successContent'></div>
        </div>
        <div id='errorHolder' class="alert alert-danger" role="alert" style='display:none;'>
            <div id='errorContent'></div>
        </div>
        <div id='corporateInformation'>
            <h2>Order page.</h2>
            <p>Verify the information for this order.
            </p>
        </div>

        <section id='corporateBody'>
            <?= $corporateOrders;?>
        </section>
    </div><!-- End content -->
</section>
<?php
    require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR ."partials/footer.php");
?>
  </body>
</html>
