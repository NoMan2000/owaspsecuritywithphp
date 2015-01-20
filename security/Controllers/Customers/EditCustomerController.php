<?php

namespace security\Controllers\Customers;

require_once(dirname(dirname(dirname(__DIR__))). DIRECTORY_SEPARATOR . 'public/init.php');

use \security\Models\PDOSingleton;
use \PDO;
use \security\Models\RedisSingleton;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\BlackLister;
use \security\Models\ErrorRunner;
use \security\Models\Login\PasswordVulnerable;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\SiteLogger\FullLog;
use \security\Interfaces\FullLogInterface;
use \security\Models\Customers\EditCustomer;
use \security\Exceptions\KnownVulnerablePasswordException;
use \security\Exceptions\WeakPasswordException;
use \InvalidArgumentException;
use \JsonSerializable;
use \StdClass;
use \SplObjectStorage;
use \Redis;

$pdo = new PDOSingleton();
$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Editing Account');
$logger->serverData();
$checkAuth = new CheckAuth($logger);
$redis = new RedisSingleton();
$errors = [];

class EditCustomerController implements JsonSerializable
{
    private $customerData = [];
    private $errors = [];
    
    public function __construct(SplObjectStorage $storage) 
    {
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
                $this->customerData['newpassword'] = $object->newpassword;
                $this->customerData['email'] = $object->email;
                $this->customerData['address'] = $object->address;
                $this->customerData['phone'] = $object->phone;
                $this->customerData['instructions'] = $object->instructions;
                $this->customerData['session'] = $object->session;
                $this->action = $object->action;
                break;
        }
    }
    protected function setDefaultPDO()
    {
        return (new PDOSingleton());
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
            case 'UpdateCustomer':
                $update = new EditCustomer(
                    $this->customerData, 
                    $this->pdo, 
                    $this->errorRunner,
                    $this->logger
                );
                $this->data = $update->updateCustomer();
                break;
        }
    }
    
    public function jsonSerialize() 
    {
        return $this->data;
    }
}

if ($isAjax) {
    $username = $auth->filledAndSet(@$_POST['username']) ? $auth->cleanString($_POST['username']) : null;
    $password = $auth->filledAndSet(@$_POST['password']) ? $_POST['password'] : null;
    $newpassword = $auth->filledAndSet(@$_POST['newpassword']) ? $_POST['newpassword'] : null;
    $newpasswordConfirm = $auth->filledAndSet(@$_POST['newpasswordConfirm']) ? $_POST['newpasswordConfirm'] : null;
    $email = $auth->filledAndSet(@$_POST['email']) ? $auth->vEmail($_POST['email']) : null;
    $address = $auth->filledAndSet(@$_POST['address']) ? $auth->cleanString($_POST['address']) : null;
    $phone = $auth->filledAndSet(@$_POST['phone']) ? $auth->vPhone($_POST['phone']) : null;
    $csrf = $auth->filledAndSet(@$_POST['csrf']) ? $csrf : null;
    
    if ($phone) {
        $phone = $auth->cInt($_POST['phone']);
    }
    $instructions = $auth->filledAndSet(@$_POST['instructions']) ? $auth->cleanString($_POST['instructions']) : null;
    $action = $auth->filledAndSet(@$_POST['action']) ? $auth->cleanString($_POST['action']) : null;
    $isCustomer = $checkAuth->isCustomer();

    $username || $errors[] = "No username was sent over.";
    $email || $errors[] = "No password was sent over.";
    $address || $errors[] = "No password was sent over.";
    $phone || $errors[] = "No phone number was sent over.";
    $csrf || $errors[] = "No token sent on request.";
    $action || $errors[] = "No action was sent over, do not have enough information.";
    $isCustomer || $errors[] = "Not a valid customer.";
    
    if ($newpassword !== $newpasswordConfirm) {
        $errors[] = "The new password and the old password must match.";
    }
    if (strlen($newpassword) > 0 && strlen($newpassword) < 8) {
        $errors[] = "The new password must be at least 8 characters long.";
    }
    if (strlen($newpassword) > 0 && strlen($password) === 0) {
        $errors[] = "You must fill in the old password to update the new one!";
    }
    $passwordCheck = new PasswordVulnerable($newpassword);
    try {
        $passwordCheck->isNotVulnerable();
    } catch(KnownVulnerablePasswordException $e) {
        $errors[] = $e->getMessage();
    } catch(WeakPasswordException $e) {
        $errors[] = $e->getMessage();
    } catch(InvalidArgumentException $e) {
        $errors[] = $e->getMessage();
    } 
    
    if ($csrf !== $_SESSION['csrf_token']) {
        $errors[] = "This form does not appear to have originated from our site.";
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
        $customerData->newpassword = $newpassword;
        $customerData->email = $email;
        $customerData->address = $address;
        $customerData->phone = $phone;
        $customerData->instructions = $instructions;
        $customerData->session = $_SESSION;
        $customerData->action = $action;

        $storage = new SplObjectStorage();
        $storage->attach($models, 'models');
        $storage->attach($customerData, 'customerData');
        $editCustomer = new EditCustomerController($storage);
        $editCustomer->switchAction();
        echo json_encode($editCustomer);
    }
    
}