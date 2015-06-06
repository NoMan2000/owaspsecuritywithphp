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
        $this->customerLogin = new CustomerLogin($models, $customerLoginData);
    }
    public function checkCustomerLogin()
    {
        $this->data = $this->customerLogin->checkCustomerLogin();
    }
    public function jsonSerialize()
    {
        return $this->data;
    }
}

$errors = [];
if (isset($_POST['submit'])) {
    extract($_POST);
}
if (!empty($submit)) {
    $auth = new Authenticate();
    $errorRunner = new ErrorRunner();
    $redis = new RedisSingleton();
    $blackList = new BlackLister($redis);
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;
    $pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
    $logger = new FullLog("Customer Login");
    $logger->serverData();

    $userName = !empty($userName) ?
    $auth->cleanString($userName) : null;
    $password = !empty($password) ? $password : null;
    $postCsrf = isset($csrf) ? $csrf : null;
    $sessionToken = isset($_SESSION['csrf_token']) ? $_SESSION['csrf_token'] : null;

    if (!$sessionToken || $sessionToken !== $postCsrf) {
        // Session token will not be set if the website is not SSL Encrypted.
        $errors[] = "This form does not appear to have originated on our site.";
    }

    $userName || $errors[] = "No username was sent over.";
    $password || $errors[] = "No password was sent over.";
    if (empty($errors)) {
        $models = new stdClass();
        $models->pdo = $pdo;
        $models->redis = $redis;
        $models->errorRunner = $errorRunner;
        $models->blackList = $blackList;
        $models->logger = $logger;

        $customerLoginData = new stdClass();
        $customerLoginData->userName = $userName;
        $customerLoginData->password = $password;

        $controller = new CustomerLoginController($models, $customerLoginData);
        $controller->checkCustomerLogin();
        if ($isAjax) {
            echo json_encode($controller);
        }
        if (!$isAjax) {
            // Do Something else.
        }
    }
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
