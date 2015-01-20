<?php

namespace security\Controllers\Customers;

require_once(dirname(dirname(dirname(__DIR__))). DIRECTORY_SEPARATOR . 'public/init.php');

use \security\Models\PDOSingleton;
use \PDO;
use \security\Models\RedisSingleton;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\SiteLogger\FullLog;
use \security\Interfaces\FullLogInterface;
use \security\Models\Customers\AddNewCustomer;
use \security\Models\Login\PasswordVulnerable;
use \JsonSerializable;
use \StdClass;
use \SplObjectStorage;
use \Redis;
use \security\Traits\IsDevelopment;


$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Add New Customer Form');
$logger->serverData();
$checkAuth = new CheckAuth($logger);
$redis = new RedisSingleton();
$error = error_get_last();
$errors = [];

class AddNewCustomerController implements JsonSerializable
{
    use IsDevelopment;
    private $customerData = [];
    private $errors = [];
    
    public function __construct(SplObjectStorage $storage) 
    {
        $this->isDev();
        $this->switchStorage($storage);
    }
    
    protected function switchStorage($storage) 
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
        switch($objectName) {
            case 'models':
                $pdo = isset($object->pdo) && is_object($object->pdo) && $object->pdo instanceof PDO ? 
                    $object->pdo : $this->setDefaultPDO();
                $errorRunner = isset($object->errorRunner) && is_object($object->errorRunner) && $object->errorRunner instanceof ErrorRunner ?
                    $object->errorRunner : $this->setDefaultErrorRunner();
                $redis = isset($object->redis) && is_object($object->redis) && $object->redis instanceof Redis ? 
                    $object->redis : $this->setDefaultRedis();
                $blackList = isset($object->blackList) && is_object($object->blackList) && $object->blackList instanceof BlackLister ? 
                    $object->blackList : $this->setDefaultBlackLister();
                $logger = isset($object->logger) && is_object($object->logger) && $object->logger instanceof FullLogInterface ?
                    $object->logger : $this->setDefaultLogger();
                $this->setPDO($pdo)
                     ->setErrorRunner($errorRunner)
                     ->setRedis($redis)
                     ->setBlackLister($blackList)
                     ->setLogger($logger);
                break;
            case 'customerData':
                $this->customerData['username'] = $object->username;
                $this->customerData['password'] = $object->password;
                $this->customerData['email'] = $object->email;
                $this->customerData['address'] = $object->address;
                $this->customerData['phone'] = $object->phone;
                $this->customerData['instructions'] = $object->instructions;
                $this->customerData['files'] = $object->files;
                $this->customerData['MAX_FILE_SIZE'] = $object->MAX_FILE_SIZE;
                $this->customerData['upload'] = $object->upload;
                $this->action = $object->action;
                break;
        }
    }
    protected function setDefaultPDO()
    {
        return (new PDOSingleton(PDOSingleton::CUSTOMERUSER));
    }
    protected function setDefaultRedis()
    {
        return (new RedisSingleton());
    }
    protected function setDefaultBlackLister()
    {
        return (new BlackLister());
    }
    protected function setDefaultErrorRunner()
    {
        return (new ErrorRunner());
    }
    protected function setDefaultLogger()
    {
        return (new FullLog());
    }
    
    public function setPDO(PDO $pdo)
    {
        $this->pdo = $pdo;
        return $this;
    }
    public function setRedis(Redis $redis)
    {
        $this->redis = $redis;
        return $this;
    }
    public function setBlackLister(BlackLister $blackList)
    {
        $this->blackList = $blackList;
        return $this;
    }
    public function setErrorRunner(ErrorRunner $errorRunner)
    {
        $this->errorRunner = $errorRunner;
        return $this;
    }
    public function setLogger(FullLogInterface $logger)
    {
        $this->logger = $logger;
        return $this;
    }
    
    public function switchAction()
    {
        $action = $this->action;
        switch($action){
            case 'addNewCustomer':
                $newCustomer = new AddNewCustomer(
                    $this->customerData, 
                    $this->pdo,
                    $this->redis,
                    $this->errorRunner,
                    $this->blackList,
                    $this->logger
                );
                $this->data = $newCustomer->addNewCustomer();
                break;
        }
    }
    public function jsonSerialize() 
    {
        return $this->data;
    }
}

if ($isAjax) {
    
    $files = $MAX_FILE_SIZE = $upload = null;
    if (isset($_POST['upload']) && $_POST['upload'] === 'true') {
    	$files = $_FILES;
    	$upload = true;
    	$MAX_FILE_SIZE = $_POST['MAX_FILE_SIZE'];
    }
    
    
    $username = $auth->filledAndSet(@$_POST['username']) ? $auth->cleanString($_POST['username']) : null;
    $password = $auth->filledAndSet(@$_POST['password']) ? $_POST['password'] : null;
    $email = $auth->filledAndSet(@$_POST['email']) ? $auth->vEmail($_POST['email']) : null;
    $address = $auth->filledAndSet(@$_POST['address']) ? $auth->cleanString($_POST['address']) : null;
    $phone = $auth->filledAndSet(@$_POST['phone']) ? $auth->vPhone($_POST['phone']) : null;
    $stop = !empty($_POST['stop']) ? true: false;
    $potentialAbuse = $auth->filledAndSet(@$_POST['potentialAbuse']) ? $auth->cInt($_POST['potentialAbuse']) : null;
    if ($stop) {
        return false;
    }
    if ($phone) {
        $phone = $auth->cInt($_POST['phone']);
    }
    $instructions = $auth->filledAndSet(@$_POST['instructions']) ? $auth->cleanString($_POST['instructions']) : null;
    $action = $auth->filledAndSet(@$_POST['action']) ? $auth->cleanString($_POST['action']) : null;

    $username || $errors[] = "No username was sent over.";
    $email || $errors[] = "No email was sent over.";
    $address || $errors[] = "No address was sent over.";
    $phone || $errors[] = "No phone number was sent over.";
    $action || $errors[] = "No action was sent over, do not have enough information.";
    $password || $errors[] = "No password was sent over.";

    if (strlen($password) > 0 && strlen($password) < 8) {
        $errors[] = "The new password must be at least 8 characters long.";
    }
    $passwordCheck = new PasswordVulnerable($password);
    try {
        $passwordCheck->isNotVulnerable();
    } catch(KnownVulnerablePasswordException $e) {
        $errors[] = $e->getMessage();
    } catch(WeakPasswordException $e) {
        $errors[] = $e->getMessage();
    } catch(InvalidArgumentException $e) {
        $errors[] = $e->getMessage();
    } 

    if (!empty($errors)) {
        $errorRunner->runErrors($errors);
    }
    if (empty($errors)) {
        $models = new StdClass;
        $models->pdo = $pdo;
        $models->redis = $redis;
        $models->errorRunner = $errorRunner;
        $models->logger = $logger;
        
        $customerData = new StdClass;
        $customerData->username = $username;
        $customerData->password = $password;
        $customerData->email = $email;
        $customerData->address = $address;
        $customerData->phone = $phone;
        $customerData->instructions = $instructions;
        $customerData->action = $action;
        $customerData->files = $files;
        $customerData->MAX_FILE_SIZE = $MAX_FILE_SIZE;
        $customerData->upload = $upload;
        if ($potentialAbuse > 1) {
            // Set a sleep timer to delay execution if potential abuse.
            $sleepTime = pow(2, $potentialAbuse);
            sleep($sleepTime);
        }

        $storage = new SplObjectStorage();
        $storage->attach($models, 'models');
        $storage->attach($customerData, 'customerData');
        $addNewCustomer = new AddNewCustomerController($storage);
        $addNewCustomer->switchAction();
        echo json_encode($addNewCustomer);
    }
    
}