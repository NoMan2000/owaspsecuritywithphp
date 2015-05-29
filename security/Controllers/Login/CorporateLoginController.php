<?php

namespace security\Controllers\Login;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \Redis;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\Login\CorporateLogin;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\SiteLogger\FullLog;
use \StdClass;

class CorporateLoginController extends BaseLoginController
{
    private $errors = [];
    private $userName;
    private $password;
    

    public function __construct(stdClass $models, stdClass $corporateData)
    {
        $this->userName = $corporateData->userName;
        $this->password = $corporateData->password;
        $this->model = new CorporateLogin($models);
    }

    public function checkUser()
    {
        $this->data = $this->model->checkUser($this->userName, $this->password);
    }
    public function jsonSerialize()
    {
        return $this->data;
    }
}

$errors = array();

$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$redis = new RedisSingleton();
$blackList = new BlackLister($redis);
$isAjax = (isset($_POST['isAjax']) && $auth->isAjax()) ? true : false;
$pdo = new PDOSingleton(PDOSingleton::CORPORATEUSER);
$logger = new FullLog('Corporate Login');
$logger->serverData();

$userName = !empty($_POST['userName']) ?
$auth->cleanString($_POST['userName']) : null;
$password = !empty($_POST['password']) ?
$_POST['password'] : null;
$action = !empty($_POST['action']) ?
$auth->cleanString($_POST['action']) : null;

$userName || $errors[] = "No email was sent over.";
$password || $errors[] = "No password was sent over.";
$action || $errors[] = "No action to perform was sent over.";

if (empty($errors) && $isAjax) {
    $modelObjects = new StdClass();
    $modelObjects->pdo = $pdo;
    $modelObjects->redis = $redis;
    $modelObjects->errorRunner = $errorRunner;
    $modelObjects->blackList = $blackList;
    $modelObjects->logger = $logger;

    $corporateLoginData = new StdClass();
    $corporateLoginData->userName = $userName;
    $corporateLoginData->password = $password;
    $corporateLoginData->action = $action;

    $controller = new CorporateLoginController($modelObjects, $corporateLoginData);
    $controller->checkUser();
    echo json_encode($controller);
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
