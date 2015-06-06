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
$errorList = '';
if (!empty($error)) {
    $errorList .= "<div id='inlineErrorHolder' class='alert alert-danger'
            role='alert'><div id='inlineErrorContent'>$error</div></div>";
}
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/customers/createNewCustomerMain.php";
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/footer.php";

?>
<script type="text/javascript" src="<?=$jsPath;?>customerCreate.js"></script>
</body>
</html>
