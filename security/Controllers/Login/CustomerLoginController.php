<?php

namespace security\Controllers\Login;

include_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php');

use \security\Models\Authenticator\Authenticate;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\Login\CustomerLogin;
use \security\Models\RedisSingleton;
use \security\Models\Authenticator\BlackLister;
use \PDO;
use \JsonSerializable;
use \Redis;
use \SplObjectStorage;
use \StdClass;
use \security\Controllers\Login\BaseLogin;
use \security\Models\SiteLogger\FullLog;

class CustomerLoginController extends BaseLoginController implements JsonSerializable
{
    private $errors = [];
    private $userName;
    private $password;
    private $jsonObject = [];
    
    public function __construct(SplObjectStorage $storage)
    {
        parent::__construct($storage);
        $this->switchObject($storage);
        $this->executeAction();
    }
    protected function storageInitializers($object, $objectName)
    {
        parent::storageInitializers($object, $objectName);
        switch($objectName) {
            case 'customerLoginData':
                $this->setUserName($object->userName)
                     ->setPassword($object->password)
                     ->setAction($object->action);
                 break;
            default:
                break;
        }
    }
    public function setUserName($userName)
    {
        $this->userName = $userName;
        return $this;
    }
    public function setAction($action)
    {
        $this->action = $action;
        return $this;
    }
    public function setPassword($password)
    {
        $this->password = $password;
        return $this;
    }
    
    public function executeAction()
    {
        $action = $this->action;
        switch($action) {
            case 'verifyLogin':
                $customerLogin = new CustomerLogin(); 
                $return = $customerLogin->checkUser(
                    $this->pdo,
                    $this->errorRunner,
                    $this->redis,
                    $this->blackList,
                    $this->userName, 
                    $this->password
                );
                if (isset($return['errors']) && !empty($return['errors'])) {
                    $this->errors[] = $return['errors'];
                    $this->errorRunner->runErrors($this->errors);
                }
                $this->jsonObject = $return;
                break;
            default:
                $this->errors[] = "No such action exists.";
                $this->errorRunner->runErrors($this->errors);
                break;
        }
    }
    public function jsonSerialize()
    {
        return $this->jsonObject;
    }
}

$errors = array();

$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$redis = new RedisSingleton();
$blackList = new BlackLister($redis);
$isAjax = (isset($_POST['isAjax']) && $auth->isAjax()) ? true : false;
$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$logger = new FullLog("Customer Login");
$logger->serverData();

if ($isAjax) {
    $userName = $auth->filledAndSet(@$_POST['userName']) ? $auth->cleanString($_POST['userName']) : null;
    $password = $auth->filledAndSet(@$_POST['password']) ? $_POST['password'] : null;
    $action = $auth->filledAndSet(@$_POST['action']) ? $auth->cleanString($_POST['action']) : null;
    $postCsrf = isset($_POST['csrf']) ? $_POST['csrf'] : null;
    
    if ($_SESSION['csrf_token'] !== $postCsrf || is_null($postCsrf)) {
        $errors[] = "This form does not appear to have originated on our site.";
    }
    
    if (is_null($userName) || is_null($password) || is_null($action)) {
        $userName || $errors[] = "No username was sent over.";
        $password || $errors[] = "No password was sent over.";
        $action || $errors[] = "No action to perform was sent over.";
        $errors[] = "A required field was missing.";
    }
    if (empty($errors)) {
        $modelObjects = new StdClass();
        $modelObjects->pdo = $pdo;
        $modelObjects->redis = $redis;
        $modelObjects->errorRunner = $errorRunner;
        $modelObjects->blackList = $blackList;
        $modelObjects->logger = $logger;
        
        $customerLoginData = new StdClass();
        $customerLoginData->userName = $userName;
        $customerLoginData->password = $password;
        $customerLoginData->action = $action;

        $storage = new SplObjectStorage();
        $storage->attach($modelObjects, 'modelObjects');
        $storage->attach($customerLoginData, 'customerLoginData');
        // Not always necessary, but rewind will make sure the object is back at position 0, 
        // like rewinding an array after a foreach loop.
        $storage->rewind();
        
        $controller = new CustomerLoginController($storage);
        $controller->setUserName($userName)
            ->setPassword($password)
            ->setAction($action)
            ->executeAction();
        echo json_encode($controller);
    }
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}