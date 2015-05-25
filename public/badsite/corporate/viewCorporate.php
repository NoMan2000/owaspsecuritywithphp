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
$pdo = new PDOSingleton(PDOSingleton::CORPORATEUSER);
$logger = new FullLog('Corporate View Page');
$checkAuth = new CheckAuth($logger);
$isCorporate = $checkAuth->isCorporate();
$router = new Router(__DIR__);
$rootPath = $router->rootPath;

if (!$isCorporate) {
    $logger->serverData();
    $logger->addWarning("User attempted to access unauthorized location.");
    $error = rawurlencode('Not an authenticated corporate user.');
    header("Location:{$rootPath}goodsite/corporate/corporatelogin.php?errors=$error");
}

$query = "SELECT id, fulfilled, unfulfilled FROM `orders` WHERE 
          `groups_id` = {$_SESSION['groupid']}";
$corporateOrders = "<header id='columnDefinitions'>
                    <div class='col-sm-3 definitionHeader'>Order id</div>
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
        $corporateOrders .= "<section id='$id'><div class='col-sm-3'>{$id}</div>
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
        $corporateOrders .= "<section id='$id'><div class='col-sm-3 fulfilled'>{$id}</div>
                             <div class='col-sm-3 fulfilled'>{$fulfilled}</div> 
                             <div class='col-sm-3 fulfilled'>{$unfulfilled}</div>
                             <div class='col-sm-3 fulfilled'></div></section>";
    }
}
$corporateOrders .= "</section>";            
?>
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
            <h2>Welcome to your Widget Corp. Corporate Orders page.</h2>  
            
            <p>If you are an admin, you can remove any orders that are fulfilled and you can edit 
            an order. </p>
            
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
        
        <?= $corporateOrders;?>
    </div><!-- End content -->

</section>
<?php 
require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR ."partials/footer.php");
?>
<script type="text/javascript" src='<?=$jsPath;?>vieworders.js'></script>
  </body>
</html>