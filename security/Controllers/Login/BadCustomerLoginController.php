<?php

namespace security\Controllers\Login;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\Login\BadCustomerLogin;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \stdClass;

class BadCustomerLoginController extends BaseLoginController
{
    private $errors = [];
    private $userName;
    private $password;

    public function __construct(stdClass $models, stdClass $customerLoginData)
    {
        $this->customerLogin = new BadCustomerLogin($models, $customerLoginData);
    }
    public function verifyLogin()
    {
        $this->data = $this->customerLogin->checkCustomerLogin();
    }
    public function jsonSerialize()
    {
        return $this->data;
    }
}

if (isset($_POST['submit']) || isset($_GET['submit'])) {
    extract($_GET);
    extract($_POST);
    $errors = [];
    $auth = new Authenticate();
    $errorRunner = new ErrorRunner();
    $redis = new RedisSingleton();
    $blackList = new BlackLister($redis);
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;
    $pdo = new PDOSingleton();

    $userName = !empty($userName) ? $userName : null;
    $password = !empty($password) ? $password : null;

    $userName || $errors[] = "No username was sent over.";
    $password || $errors[] = "No password was sent over.";
    if (empty($errors)) {
        $models = new stdClass();
        $models->pdo = $pdo;
        $models->redis = $redis;
        $models->errorRunner = $errorRunner;
        $models->blackList = $blackList;

        $customerLoginData = new stdClass();
        $customerLoginData->userName = $userName;
        $customerLoginData->password = $password;

        $controller = new BadCustomerLoginController($models, $customerLoginData);
        $controller->verifyLogin();
        if ($isAjax) {
            echo json_encode($controller);
        }
        if (!$isAjax) {
            // Do something else
        }
    }
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
