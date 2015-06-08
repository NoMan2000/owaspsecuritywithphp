<?php

namespace security\Controllers\Login;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \Redis;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\Login\BadCorporateLogin;
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
        $this->model = new BadCorporateLogin($models);
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

if (isset($_POST['submit']) || isset($_GET['submit'])) {
    extract($_POST);
    extract($_GET);
    $errors = [];
    $auth = new Authenticate();
    $errorRunner = new ErrorRunner();
    $redis = new RedisSingleton();
    $blackList = new BlackLister($redis);
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;
    $pdo = new PDOSingleton(PDOSingleton::CORPORATEUSER);
    $logger = new FullLog('Corporate Login');
    $logger->serverData();

    $userName = !empty($userName) ? $auth->cleanString($userName) : null;
    $password = !empty($password) ? $password : null;
    $action = !empty($action) ? $auth->cleanString($action) : null;

    $userName || $errors[] = "No email was sent over.";
    $password || $errors[] = "No password was sent over.";

    if (empty($errors)) {
        $modelObjects = new StdClass();
        $modelObjects->pdo = $pdo;
        $modelObjects->redis = $redis;
        $modelObjects->errorRunner = $errorRunner;
        $modelObjects->blackList = $blackList;
        $modelObjects->logger = $logger;

        $corporateLoginData = new StdClass();
        $corporateLoginData->userName = $userName;
        $corporateLoginData->password = $password;

        $controller = new CorporateLoginController($modelObjects, $corporateLoginData);
        $controller->checkUser();
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
