<?php
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/header.php";

use \security\Controllers\Customers\InitCustomerController;
use \security\Controllers\Customers\ViewOrdersController;
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
$logger = new FullLog('Customer Login Page');
$checkAuth = new CheckAuth($logger);
$customerID = isset($_GET['id']) ? $_GET['id'] : null;
if (!$customerID) {
    $error = rawurlencode('Not an authenticated consumer.');
    die(header("Location:{$rootPath}goodsite/index.php?errors=$error"));
}

$pdo = new PDOSingleton();
$models = new stdClass();
$models->pdo = $pdo;
$models->errorRunner = $errorRunner;
$models->logger = $logger;
$orderData = new stdClass();
$orderData->customerID = $_GET['id'];

$controller = new ViewOrdersController($models, $orderData);
$controller->viewOrders();
$orders = $controller->getOrders();

$customerOrders = "";
if ($orders) {
    foreach ($orders as $row) {
        $id = htmlentities($row['id']);
        $fulfilled = htmlentities($row['fulfilled']);
        $unfulfilled = htmlentities($row['unfulfilled']);
        $allFulfilled = false;
        if ($fulfilled === $unfulfilled) {
            $allFulfilled = true;
        }
        if (!$allFulfilled) {
            $customerOrders .= "<section id='$id' class='clearfix'><div class='col-sm-3'>{$id}</div>
                                 <div class='col-sm-3'>{$fulfilled}</div>
                                 <div class='col-sm-3'>{$unfulfilled}</div>
                                 <div class='col-sm-3'>
                                     <button type='button' class='btn btn-danger'
                                     type='submit' name='submit'
                                     data-confirm='Delete the order?'
                                     data-id='$id'
                                     data-unfulfilled='$unfulfilled'
                                     >
                                     Delete Order</button>
                                 </div></section>";
        }
        if ($allFulfilled) {
            $customerOrders .= "<section id='$id' class='fulfilled clearfix'><div class='col-sm-3'>{$id}</div>
                                 <div class='col-sm-3'>{$fulfilled}</div>
                                 <div class='col-sm-3'>{$unfulfilled}</div>
                                 <div class='col-sm-3'></div></section>";
        }

    }
}
$customer = new stdClass();
$customer->session = $_SESSION;

$controller = new InitCustomerController($models, $customer);
$controller->setCustomerValues();
$customerInfo = $controller->getCustomerValues();

$address = htmlentities($customerInfo['address']);
$email = htmlentities($customerInfo['email']);
$phone = htmlentities($customerInfo['phone']);
$instructions = !empty($customerInfo['instructions']) ?
htmlentities($customerInfo['instructions']) : null;

$customerInformation = "<p>We will send a confirmation email to $email when your packages are ready.</p>
<p>They will be
delivered to $address and we will call you at $phone when they are delivered.</p>";
if ($instructions) {
    $customerInformation .= "<p>You also specified the following additional instructions:</p>
    <blockquote>$instructions</blockquote>";
}
?>

<?php
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'partials/customers/viewordersNavbar.php';
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/customers/viewordersForm.php";
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/footer.php";
?>
<script type="text/javascript" src='<?=$jsPath;?>vieworders.js'></script>
  </body>
</html>
