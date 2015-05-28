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
use \StdClass;

class BadCustomerLoginController extends BaseLoginController
{
    private $errors = [];
    private $userName;
    private $password;
    private $jsonObject = [];

    public function __construct(stdClass $models, stdClass $customerLoginData)
    {
        $this->userName = $customerLoginData->userName;
        $this->password = $customerLoginData->password;
        $this->action = $customerLoginData->action;

        $this->customerLoginModel = new CustomerLogin($models);
    }
    public function verifyLogin()
    {
        $this->data = $customerLogin->checkUser(
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
$pdo = new PDOSingleton();

$userName = !empty($_POST['userName']) ? $_POST['userName'] : null;
$password = !empty($_POST['password']) ? $_POST['password'] : null;

$userName || $errors[] = "No email was sent over.";
$password || $errors[] = "No password was sent over.";

if (empty($errors)) {
    $modelObjects = new StdClass();
    $modelObjects->pdo = $pdo;
    $modelObjects->redis = $redis;
    $modelObjects->errorRunner = $errorRunner;
    $modelObjects->blackList = $blackList;

    $customerLoginData = new StdClass();
    $customerLoginData->userName = $userName;
    $customerLoginData->password = $password;

    $controller = new CustomerLoginController($models, $customerLoginData);
    $controller->verifyLogin();
    if ($isAjax) {
        echo json_encode($controller);
    }
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
