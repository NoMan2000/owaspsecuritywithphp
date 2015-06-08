<?php
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/header.php";

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
$logger = new FullLog('Bad Corporate View Page');
$checkAuth = new CheckAuth($logger);
$router = new Router(__DIR__);
$rootPath = $router->rootPath;

// if (!$isCorporate) {
//     $logger->serverData();
//     $logger->addWarning("User attempted to access unauthorized location.");
//     $error = rawurlencode('Not an authenticated corporate user.');
//     header("Location:{$rootPath}goodsite/corporate/corporatelogin.php?errors=$error");
// }

$query = "SELECT id, fulfilled, unfulfilled FROM `orders` WHERE
          `groups_id` = {$_GET['id']}";
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

require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/corporate/viewCorporateNavbar.php";
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/corporate/viewCorporateMain.php";
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/footer.php";
?>
<script type="text/javascript" src='<?=$jsPath;?>vieworders.js'></script>
  </body>
</html>
