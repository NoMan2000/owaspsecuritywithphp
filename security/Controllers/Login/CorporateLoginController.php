<?php

namespace security\Controllers\Login;

require_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php');

use \security\Models\Authenticator\Authenticate;
use \security\Models\ErrorRunner;
use \security\Models\PDOSingleton;
use \security\Models\Login\CorporateLogin;
use \security\Models\RedisSingleton;
use \security\Models\Authenticator\BlackLister;
use \PDO;
use \JsonSerializable;
use \Redis;
use \SplObjectStorage;
use \StdClass;
use \security\Models\SiteLogger\FullLog;
use \security\Controllers\Login\BaseLogin;

class CorporateLoginController extends BaseLoginController implements JsonSerializable
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
    public function switchObject(SplObjectStorage $storage)
    {
        $storage->rewind();
        while($storage->valid()) {
            $object = $storage->current(); 
            $data = $storage->getInfo();
            $this->storageInitializers($object, $data);
            $storage->next();
        }
    }
    
    protected function storageInitializers($object, $objectName)
    {
        parent::storageInitializers($object, $objectName);
        switch($objectName) {
            case 'corporateLoginData':
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
                $corporateLogin = new CorporateLogin(); 
                $return = $corporateLogin->checkUser(
                    $this->pdo,
                    $this->errorRunner,
                    $this->redis,
                    $this->blackList,
                    $this->logger,
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
$pdo = new PDOSingleton(PDOSingleton::CORPORATEUSER);
$logger = new FullLog('Corporate Login');
$logger->serverData();

if ($isAjax) {
    $userName = $auth->filledAndSet(@$_POST['userName']) ? $auth->cleanString($_POST['userName']) : null;
    $password = $auth->filledAndSet(@$_POST['password']) ? $_POST['password'] : null;
    $action = $auth->filledAndSet(@$_POST['action']) ? $auth->cleanString($_POST['action']) : null;
    
    if (is_null($userName) || is_null($password) || is_null($action)) {
        $userName || $errors[] = "No email was sent over.";
        $password || $errors[] = "No password was sent over.";
        $action = $action || $errors[] = "No action to perform was sent over.";
        $errors[] = "A required field was missing.";
    }
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
        $corporateLoginData->action = $action;

        $storage = new SplObjectStorage();
        $storage->attach($modelObjects, 'modelObjects');
        $storage->attach($corporateLoginData, 'corporateLoginData');
        // Not always necessary, but rewind will make sure the object is back at position 0, 
        // like rewinding an array after a foreach loop.
        $storage->rewind();
        
        $controller = new CorporateLoginController($storage);
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