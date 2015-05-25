<?php

require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR ."partials/header.php");

use \security\Models\Authenticator\CheckAuth;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \Monolog\Logger;
use \Monolog\Handler\StreamHandler;
use \security\Models\RedisSingleton;
use \security\Models\Router\Router;
use \security\Models\PDOSingleton;
use \security\Controllers\Customers\InitCustomerController;
use \PDO;

$router = new Router(__DIR__);
$rootPath = $router->rootPath;
$redis = new RedisSingleton();
$errorRunner = new ErrorRunner();
$logger = new Monolog\Logger('Customer Edit Form');
$checkAuth = new CheckAuth($logger);
$isCustomer = $checkAuth->isCustomer();
if (!$isCustomer) {
    header("Location:{$rootPath}badsite/index.php?errors=Not an authenticated consumer.`");
}
$pdo = new PDOSingleton();
$customer = new InitCustomerController($pdo);
$customerValues = $customer->getArrayValues();
foreach ($customerValues as $key => $value) {
    // shorthand version to assign single index array values into an automatic variable.
    $$key = $value;
}

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
        <?php if (isset($error)) {?>
            <div id='inlineErrorHolder' class="alert alert-danger" role="alert">
            <div id='inlineErrorContent'><?= $error;?></div>
            </div>
        <?php } ?>
        
      <form class="form-signin form-horizontal" id='customerEditForm'
        role="form" method='POST' 
        action='#' novalidate='novalidate'>
        <input type='hidden' id='csrf' value='<?= $_SESSION['csrf_token'];?>' />
        <h1 class="form-signin-heading text-center">Customer edit form</h1>
        <h4 class='textContent'><?= $username; ?></h4>
        <input type='hidden' name='actionType' id='actionType' data-action='updateCustomer' />
        <div class="form-group">
            <label for="inputUserName" class="col-sm-2 control-label">Username:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputUserName' id="inputUserName" class="form-control" 
                placeholder="Your new username" required="" autofocus="" autocomplete="off" 
                data-original='<?=$username;?>'
                value='<?=$username;?>'>
            </div>
        </div>
        <div class="form-group">
            <label for="originalPassword" class="col-sm-2 control-label">Original Password:</label>
            <div class='col-sm-10'>
            <input type="password" name='originalPassword' id="originalPassword" class="form-control"
                placeholder="old Password" autocomplete="off" value=''>
            </div>
        </div>
        
        <div class="form-group">
            <label for="newPassword" class="col-sm-2 control-label">New Password:</label>
            <div class='col-sm-10'>
            <input type="password" name='newPassword' id="newPassword" class="form-control" 
                placeholder="New Password" autocomplete="off" value=''>
            </div>
        </div>
        
        <div class="form-group">
            <label for="newPasswordConfirm" class="col-sm-2 control-label">Confirm New Password:</label>
            <div class='col-sm-10'>
            <input type="password" name='newPasswordConfirm' id="newPasswordConfirm" class="form-control" 
                placeholder="Confirm New Password" autocomplete="off" value=''>
            </div>
        </div>
        
        <div class="form-group">
            <label for="inputEmail" class="col-sm-2 control-label">Email:</label>
            <div class='col-sm-10'>
                <input type="email" name='inputEmail' id="inputEmail" class="form-control" 
                placeholder="Your Email address" required="" autocomplete="off" 
                data-original='<?=$email;?>'
                value='<?=$email;?>'>
            </div>
        </div>
        
        <div class="form-group">
            <label for="inputAddress" class="col-sm-2 control-label">Address:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputAddress' id="inputAddress" class="form-control" 
                placeholder="Your Email address" required="" autocomplete="off" 
                data-original="<?=$address;?>"
                value='<?=$address;?>'>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPhone" class="col-sm-2 control-label">Phone:</label>
            <div class='col-sm-10'>
                <input type="tel" name='inputPhone' id="inputPhone" class="form-control" 
                placeholder="Your Phone Number" required="" autocomplete="off" 
                data-original="<?=$phone;?>"
                value='<?=$phone;?>'>
            </div>
        </div>

        <div class="form-group">
            <label for="inputInstructions" class="col-sm-2 control-label">Instructions:</label>
            <div class='col-sm-10'>
                <textarea name="inputInstructions" id='inputInstructions' class='form-control' 
                data-original='<?=trim($instructions);?>'
                style='resize:vertical;'/><?= trim($instructions);?></textarea>
            </div>
            <!-- Whitespace in textarea is very common, so it has to be inlined. -->
        </div>        
        <button class="btn btn-lg btn-primary center-block" type="submit">Change info</button>
        <p>&nbsp;</p>
      </form>
        

    </div><!-- End content -->
</section>
<?php 
    require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR ."partials/footer.php");
?>
<script type="text/javascript" src="<?=$jsPath;?>customeredit.js"></script>
</body>
</html>