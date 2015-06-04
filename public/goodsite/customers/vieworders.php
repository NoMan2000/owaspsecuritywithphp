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
$isCustomer = $checkAuth->isCustomer();
$customerID = isset($_SESSION['customerid']) ? $_SESSION['customerid'] : null;
if (!$isCustomer || !$customerID) {
    $error = rawurlencode('Not an authenticated consumer.');
    die(header("Location:{$rootPath}goodsite/index.php?errors=$error"));
}

$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$models = new stdClass();
$models->pdo = $pdo;
$models->errorRunner = $errorRunner;
$models->logger = $logger;
$orderData = new stdClass();
$orderData->customerID = $customerID;

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
$controller = new InitCustomerController($models, $_SESSION);
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
<?php require_once dirname(dirname(__DIR__)) . '/partials/customers/viewordersNavbar.php';?>


<section class="container-fluid row">
    <div id='content' class='clearfix col-xs-12
      col-sm-offset-3 col-md-offset-3 col-lg-offset-3
      col-sm-6 col-md-6 col-lg-6'>
        <div id='successHolder' class="alert alert-success" role="alert" style='display:none;'>
            <div id='successContent'></div>
        </div>
        <div id='errorHolder' class="alert alert-danger" role="alert" style='display:none;'>
            <div id='errorContent'></div>
        </div>
        <div id='customerInformation'>
            <h2>Welcome to your Widget Corp. Customer Orders page.</h2>
            <?=$customerInformation;?>
            <p>You can remove any orders that you no longer want and check the status of orders.  Please note that
            you cannot delete an order which has already been fulfilled.</p>
            <p>If this information is inaccurate, go to the <a href="customerEdit.php">Customer Edit Page</a> and change it.

            </p>
        <button type="button" class="btn btn-info" id='createNewOrder' aria-label="Left Align">
          <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
          <span id='textForOrder'>Make new order</span>
        </button>
        </div>
        <div id='showOrder' style='display:none;margin-bottom:2rem;'>
            <form id='addNewOrder' name='addNewOrder' method='post' action='#' novalidate>
                <input type='hidden' id='csrf' value='<?=$_SESSION['csrf_token'];?>' />
                <div class="form-group">
                <label for="newOrder" class="col-sm-2 control-label">New Order:</label>
                <div class='col-sm-10'>
                    <input type="number" name='newOrder' id="newOrder" class="form-control"
                    placeholder="Number to Order" min='0' required="" autocomplete="off"
                    data-original=""
                    value=''>
                    </div>
                </div>
                <button type='submit' class='btn btn-default' id='submitNewOrder'>
                    Add Order
                </button>
            </form>
        </div>
        <header id='columnDefinitions'><div class='col-sm-3 definitionHeader'>Order id</div>
           <div class='col-sm-3 definitionHeader'>Fulfilled</div>
           <div class='col-sm-3 definitionHeader'>Unfulfilled</div>
           <div class='col-sm-3 definitionHeader'>Delete Order</div>
       </header>
       <section id='customerBody'>
        <?=$customerOrders;?>
        </section>
    </div><!-- End content -->

</section>
<?php
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/footer.php";
?>
<script type="text/javascript" src='<?=$jsPath;?>vieworders.js'></script>
  </body>
</html>
