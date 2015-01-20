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
use \security\Models\FileUploader\FileUploader;
use \security\Exceptions\FolderException;
use \security\Models\SiteLogger\FullLog;

$router = new Router(__DIR__);
$rootPath = $router->rootPath;
$redis = new RedisSingleton();
$errorRunner = new ErrorRunner();
$logger = new FullLog("Create new Customer");
$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$blacklist = new BlackLister();
if (!isset($_SESSION["visits"])) {
    $_SESSION["visits"] = 0;
}
$_SESSION["visits"] = $_SESSION["visits"] + 1;
 
if ($_SESSION["visits"] > 5) {
    $logger->serverData();
    // increment the blacklister by one.
    $logger->addWarning("Someone is repeatedly visiting the create new customer account, this is their {$_SESSION['visit']}.  Potential abuse.");
    $blacklist->blackList();
} 

if ($blacklist->isBlackListed()) {
    // Again, this is an incredibly weak protection.
    $logger->addError("This IP has been flagged as abusive.");
    foreach ($blacklist->IP as $badIP) {
        $logger->addError("badIP at $badIP");
    }
    die("This account has been flagged as abusive.");
}

$_SESSION['maxfiles'] = ini_get('max_file_uploads');
$_SESSION['postmax'] = FileUploader::convertToBytes(ini_get('post_max_size'));
$_SESSION['displaymax'] = FileUploader::convertFromBytes($_SESSION['postmax']);

$max = 200 * 1024;

?>


<section class="container-fluid row">
    
    <div id='content' class='clearfix col-xs-12 
      col-sm-offset-3 col-md-offset-3 col-lg-offset-3
      col-sm-6 col-md-6 col-lg-6'>
        <div id='successHolder' class="alert alert-success" role="alert" style='display:none;'>
            <div id='successContent'>
                
            </div>
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
        action='<?php echo $_SERVER['PHP_SELF'];?>' novalidate='novalidate' 
        enctype="multipart/form-data">
        <input type='hidden' id='csrf' value='<?= $_SESSION['csrf_token'];?>' />
        <h1 class="form-signin-heading text-center">Create Customer form</h1>
        <h4 class='textContent'>Create new customer:</h4>
        
        <div class="form-group">
            <label for="inputUserName" class="col-sm-2 control-label">Username:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputUserName' id="inputUserName" class="form-control" 
                placeholder="Your new username" required="" autofocus="" autocomplete="off" 
                data-original=''
                value=''>
            </div>
        </div>
       
        <div class="form-group">
            <label for="newPassword" class="col-sm-2 control-label">Password:</label>
            <div class='col-sm-10'>
            <input type="password" name='newPassword' id="newPassword" 
                data-toggle="tooltip" data-placement="right" title="" data-original-title="Must be at least 8 characters, two uppercase, two lowercase, two special characters or numbers."
                class="form-control" 
                placeholder="New Password" autocomplete="off" value=''>
            </div>
        </div>
        
        <div class="form-group">
            <label for="newPasswordConfirm" class="col-sm-2 control-label">Confirm Password:</label>
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
                data-original=''
                value=''>
            </div>
        </div>
        
        <div class="form-group">
            <label for="inputAddress" class="col-sm-2 control-label">Address:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputAddress' id="inputAddress" class="form-control" 
                placeholder="Your Mailing address" required="" autocomplete="off" 
                data-original=""
                value=''>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPhone" class="col-sm-2 control-label">Phone:</label>
            <div class='col-sm-10'>
                <input type="tel" name='inputPhone' id="inputPhone" class="form-control" 
                placeholder="Your Phone Number" required="" autocomplete="off" 
                data-original=""
                value=''>
            </div>
        </div>
        <!--Honey pot trap-->
        <div class="form-group hidden">
            <label for="inputStop" class="col-sm-2 control-label">Information:</label>
            <div class='col-sm-10'>
                <input type="text" name='inputStop' id="inputStop" class="form-control" 
                placeholder="Your Message to us" required="" autocomplete="off" 
                data-original=""
                value=''>
            </div>
        </div>

        <div class="form-group">
            <label for="inputInstructions" class="col-sm-2 control-label">Instructions:</label>
            <div class='col-sm-10'>
                <textarea name="inputInstructions" id='inputInstructions' class='form-control' 
                data-original=''
                style='resize:vertical;'/></textarea>
            </div>
        </div>        
        <input type="hidden" id='MAX_FILE_SIZE' name="MAX_FILE_SIZE" value="<?php echo $max;?>">
        <div class='col-sm-10 col-sm-offset-2 bg-info' id='fileUploadMessages'>
        <h3>Special Upload Instructions:</h3>
        <p>If you have a long list of instructions you need to upload, you can do so here.</p>
        <p>Up to <?php echo $_SESSION['maxfiles'];?> files can be uploaded simultaneously.</p>
        <p>Each file should be no more than <?php echo FileUploader::convertFromBytes($max);?>.</p>
        <p>Combined total should not exceed <?php echo $_SESSION['displaymax'];?>.</p>
        <p>&nbsp;</p>
        </div>
        <div class="form-group">
            <label for="filename" class="col-sm-2 control-label">Select Files:</label>
            <span class='col-sm-3 file-input btn btn-default btn-file' style='margin-top:1rem;margin-left:1rem;'>
            <input type="file" class='' name="filename[]" id="filename" multiple
            data-maxfiles="<?php echo $_SESSION['maxfiles'];?>"
            data-postmax="<?php echo $_SESSION['postmax'];?>"
            data-displaymax="<?php echo $_SESSION['displaymax'];?>">
            Choose Files for Upload.
            </span>
            <div class='col-sm-7'></div>
        </div>
        <button class="btn btn-lg btn-primary center-block" type="submit">Create new Customer</button>
        <p>&nbsp;</p>
        
      </form>
        

    </div><!-- End content -->
</section>
<?php 
    require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR ."partials/footer.php");
?>
<script type="text/javascript" src="<?=$jsPath;?>customerCreate.js"></script>
</body>
</html>