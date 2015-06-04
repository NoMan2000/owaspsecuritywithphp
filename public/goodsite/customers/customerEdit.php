<?php

require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/header.php";

use \security\Controllers\Customers\InitCustomerController;
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
$logger = new FullLog('Customer Edit Form');
$checkAuth = new CheckAuth($logger);
$isCustomer = $checkAuth->isCustomer();
if (!$isCustomer) {
    header("Location:{$rootPath}goodsite/index.php?errors=Not an authenticated consumer.`");
}
$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$models = new stdClass();
$models->redis = $redis;
$models->errorRunner = $errorRunner;
$models->logger = $logger;
$models->checkAuth = $checkAuth;
$models->pdo = $pdo;

$customer = new InitCustomerController($models, $_SESSION);
$customer->setCustomerValues();
$customerValues = $customer->getCustomerValues();
extract($customerValues);

?>
<nav class="navbar navbar-default">
  <div class="container-fluid bg-info">
    <div class="navbar-header">
      <a class="navbar-brand" id='sessionLogout' href="#">Log out</a>
      <ul class="nav navbar-nav">
          <li class='active'><a href="customerEdit.php">Edit Account</a></li>
          <li><a href="vieworders.php">View Orders</a></li>
      </ul>
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
<?php if (isset($error)) {?>
        <div id='inlineErrorHolder' class="alert alert-danger" role="alert">
            <div id='inlineErrorContent'><?=$error;?></div>
        </div>
<?php }
?>

      <form class="form-signin form-horizontal" id='customerEditForm'
        role="form" method='POST'
        action='#' novalidate='novalidate'>
        <input type='hidden' id='csrf' value='<?=$_SESSION['csrf_token'];?>' />
        <h1 class="form-signin-heading text-center">Customer edit form</h1>
        <h4 class='textContent'><?=$username;?></h4>
        <input type='hidden' name='actionType' id='actionType' data-action='updateCustomer' />
        <?php require_once dirname(dirname(__DIR__)) . '/partials/customers/customerEditInputs.php'; ?>
        <button class="btn btn-lg btn-primary center-block" type="submit">Change info</button>
        <p>&nbsp;</p>
      </form>
    </div><!-- End content -->
</section>
<?php
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/footer.php";
?>
<script type="text/javascript" src="<?=$jsPath;?>customeredit.js"></script>
</body>
</html>
