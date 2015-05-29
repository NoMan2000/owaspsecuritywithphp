<?php

namespace security\Controllers\Login;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \Redis;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\Login\CustomerLogin;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\SiteLogger\FullLog;
use \stdClass;

class CustomerLoginController extends BaseLoginController
{
    private $errors = [];
    private $userName;
    private $password;

    public function __construct(stdClass $models, stdClass $customerLoginData)
    {
        $this->userName = $customerLoginData->userName;
        $this->password = $customerLoginData->password;
        $this->customerLogin = new CustomerLogin($models);
    }
    public function checkCustomerLogin()
    {
        $this->data = $this->customerLogin->checkCustomerLogin(
            $this->userName,
            $this->password
        );
    }
    public function jsonSerialize()
    {
        return $this->data;
    }
}

$errors = [];

$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$redis = new RedisSingleton();
$blackList = new BlackLister($redis);
$isAjax = (isset($_POST['isAjax']) && $auth->isAjax()) ? true : false;
$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$logger = new FullLog("Customer Login");
$logger->serverData();

$userName = !empty($_POST['userName']) ?
$auth->cleanString($_POST['userName']) : null;
$password = !empty($_POST['password']) ? $_POST['password'] : null;
$postCsrf = isset($_POST['csrf']) ? $_POST['csrf'] : null;
$sessionToken = isset($_SESSION['csrf_token']) ? $_SESSION['csrf_token'] : null;

if (!$sessionToken || $_SESSION['csrf_token'] !== $postCsrf) {
    // Session token will not be set if the website is not SSL Encrypted.
    $errors[] = "This form does not appear to have originated on our site.";
}

$userName || $errors[] = "No username was sent over.";
$password || $errors[] = "No password was sent over.";

if (empty($errors) && $isAjax) {
    $modelObjects = new stdClass();
    $modelObjects->pdo = $pdo;
    $modelObjects->redis = $redis;
    $modelObjects->errorRunner = $errorRunner;
    $modelObjects->blackList = $blackList;
    $modelObjects->logger = $logger;

    $customerLoginData = new stdClass();
    $customerLoginData->userName = $userName;
    $customerLoginData->password = $password;

    $controller = new CustomerLoginController($modelObjects, $customerLoginData);
    $controller->checkCustomerLogin();
    echo json_encode($controller);
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
