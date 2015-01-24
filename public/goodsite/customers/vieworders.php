<?php
require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR ."partials/header.php");

use \security\Models\Authenticator\CheckAuth;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\SiteLogger\FullLog;
use \security\Models\RedisSingleton;
use \security\Models\Router\Router;
use \security\Models\PDOSingleton;
use \PDO;

$router = new Router(__DIR__);
$rootPath = $router->rootPath;

$redis = new RedisSingleton();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Login Page');
$checkAuth = new CheckAuth($logger);
$isCustomer = $checkAuth->isCustomer();
if (!$isCustomer) {
    $error = rawurlencode('Not an authenticated consumer.');
    die(header("Location:{$rootPath}goodsite/index.php?errors=$error"));
}
$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);

$query = "SELECT id, fulfilled, unfulfilled FROM `orders` 
    WHERE customers_id = {$_SESSION['customerid']}";
$customerOrders = "<header id='columnDefinitions'><div class='col-sm-3 definitionHeader'>Order id</div>
                   <div class='col-sm-3 definitionHeader'>Number Fulfilled</div>
                   <div class='col-sm-3 definitionHeader'>Number Unfulfilled</div>
                   <div class='col-sm-3 definitionHeader'>Delete Order</div>
                   </header>
                   <section id='customerBody'>";
foreach ($pdo->query($query) as $row) {
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
    $customerOrders .= "</section>";            
    $query = "SELECT address, email, phone, instructions FROM customers WHERE id={$_SESSION['customerid']}";
    foreach ($pdo->query($query) as $row) {
        $address = htmlentities($row['address']);
        $email = htmlentities($row['email']);
        $phone = htmlentities($row['phone']);
        $instructions = isset($row['instructions']) && !empty($row['instructions']) ? 
            htmlentities($row['instructions']) : null;
    }
    $customerInformation = "<p>We will send a confirmation email to $email when your packages are ready.</p>
    <p>They will be 
    delivered to $address and we will call you at $phone when they are delivered.</p>";
    if (!is_null($instructions)) {
        $customerInformation .= "<p>You also specified the following additional instructions:</p><blockquote>$instructions</blockquote>";
    }
?>
<nav class="navbar navbar-default">
  <div class="container-fluid bg-info">
    <div class="navbar-header">
      <a class="navbar-brand" id='sessionLogout' href="#">Log out</a>
    </div>
  </div>
</nav>


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
            <?= $customerInformation; ?>
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
                <input type='hidden' id='csrf' value='<?= $_SESSION['csrf_token'];?>' />
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
        
        <?= $customerOrders;?>
    </div><!-- End content -->

</section>
<?php 
require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR ."partials/footer.php");
?>
<script type="text/javascript" src='<?=$jsPath;?>vieworders.js'></script>
  </body>
</html>