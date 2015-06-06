<?php

require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/header.php";

use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\FileUploader\FileUploader;
use \security\Models\Generator\CountryList;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\Router\Router;
use \security\Models\SiteLogger\FullLog;

$countryList = new CountryList();
$countries = $countryList->getCountryList();
$countryOptions = '';
foreach ($countries as $code => $countryName) {
    $countryOptions .= "<option value='{$code}'>{$countryName}</option>";
}

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
    $logger->addWarning("Someone is repeatedly visiting the create new customer account, this is their {$_SESSION['visits']}.  Potential abuse.");
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

$username = $email = $address = $phone = $city = $state = $countrycode =
$zip = $instructions = $hasPassword = null;

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
            <div id='inlineErrorContent'><?=$error;?></div>
            </div>
        <?php }
?>

      <form class="form-signin form-horizontal" id='customerEditForm'
        role="form" method='POST'
        action='<?=$_SERVER['PHP_SELF'];?>' novalidate='novalidate'
        enctype="multipart/form-data">
        <input type='hidden' id='csrf' value='<?=$_SESSION['csrf_token'];?>' />
        <h1 class="form-signin-heading text-center">Create Customer form</h1>
        <h4 class='textContent'>Create new customer:</h4>

        <?php require_once dirname(dirname(__DIR__)) . '/partials/customers/customerEditInputs.php';?>

        <input type="hidden" id='MAX_FILE_SIZE' name="MAX_FILE_SIZE" value="<?php echo $max;?>">
        <div class='col-sm-10 col-sm-offset-2 bg-info' id='fileUploadMessages'>
        <h3>Special Upload Instructions:</h3>
        <p>If you have a long list of instructions you need to upload, you can do so here.</p>
        <p>Up to <?=$_SESSION['maxfiles'];?> files can be uploaded simultaneously.</p>
        <p>Each file should be no more than <?=FileUploader::convertFromBytes($max);?>.</p>
        <p>Combined total should not exceed <?=$_SESSION['displaymax'];?>.</p>
        <p>&nbsp;</p>
        </div>
        <div class="form-group">
            <label for="filename" class="col-sm-2 control-label">Select Files:</label>
            <span class='file-input btn btn-default btn-file' style='margin-top:1rem;margin-left:1rem;'>
            <input type="file" class='' name="filename[]" id="filename" multiple
            data-maxfiles="<?=$_SESSION['maxfiles'];?>"
            data-postmax="<?=$_SESSION['postmax'];?>"
            data-displaymax="<?=$_SESSION['displaymax'];?>">
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
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/footer.php";
?>
<script type="text/javascript" src="<?=$jsPath;?>customerCreate.js"></script>
</body>
</html>
