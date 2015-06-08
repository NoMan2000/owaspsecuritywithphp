<?php

require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/header.php";

use \security\Controllers\Customers\InitCustomerController;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\ErrorRunner;
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
$logger = new FullLog('Customer Edit Form');
$checkAuth = new CheckAuth($logger);
$isCustomer = $checkAuth->isCustomer();
if (!$isCustomer) {
    header("Location:{$rootPath}badsite/index.php?errors=Not an authenticated consumer.`");
}
$pdo = new PDOSingleton();
$models = new stdClass();
$models->redis = $redis;
$models->errorRunner = $errorRunner;
$models->logger = $logger;
$models->checkAuth = $checkAuth;
$models->pdo = $pdo;

$customerModel = new stdClass();
$customerModel->session = $_SESSION;

$customer = new InitCustomerController($models, $customerModel);
$customer->setCustomerValues();
$customerValues = $customer->getCustomerValues();
extract($customerValues);
$errorList = '';
if (isset($error)) {
    $errorList .= "<div id='inlineErrorHolder'
            class='alert alert-danger' role='alert'>
            <div id='inlineErrorContent'>$error</div>
        </div>";
}
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'partials/customers/customerEditNavbar.php';
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'partials/customers/customerEditMain.php';
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/footer.php";

?>
<script type="text/javascript" src="<?=$jsPath;?>customeredit.js"></script>
</body>
</html>
