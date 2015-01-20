<?php

namespace security\Controllers\Customers;

require_once(dirname(dirname(dirname(__DIR__))). DIRECTORY_SEPARATOR . 'public/init.php');

use \security\Models\Authenticator\Authenticate;
use \security\Models\ErrorRunner;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\SiteLogger\FullLog;
use \security\Interfaces\FullLogInterface;
use \SplObjectStorage;
use \StdClass;
use \JsonSerializable;
use \security\Models\Customers\DestroySession;
use \security\Models\SessionInitializers;

$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Logging out');
$checkAuth = new CheckAuth($logger);
$init = new SessionInitializers();
$errors = [];

class DestroySessionController implements JsonSerializable
{
    private $action;
    private $data;
    
    public function __construct(SplObjectStorage $storage)
    {
        $this->switchObject($storage);
        $this->switchAction();
    }
    protected function switchObject($storage)
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
            case 'customerData':
                 $this->setAction($object->action);
                 break;
            case 'modelObjects':
                $this->setInit($object->init);
                break;
        }
    }
    public function setInit(SessionInitializers $init)
    {
        $this->init = $init;
    }
    protected function setAction($action)
    {
        $this->action = $action;
        return $this;
    }
    protected function switchAction()
    {
        $action = $this->action;
        switch($action){
            case 'destroySession':
                $destroy = new DestroySession($this->init);
                $this->data['loggedout'][] = $destroy;
                break;
        }
    }
    public function jsonSerialize()
    {
        return $this->data;
    }
}

if ($isAjax) {
    $action = $auth->filledAndSet(@$_POST['action']) ? $_POST['action'] : null;
    $isCustomer = $checkAuth->isCustomer();
    $csrf = $auth->filledAndSet(@$_POST['csrf']) ? $_POST['csrf'] : null;
    $session = isset($_SESSION) ? $_SESSION : null;
    $csrf || $errors[] = "There is no token for this account.  You have most likely timed out.";
    $isCustomer || $errors[] = "You are not authenticated as a customer.";
    $session || $errors[] = "You do not have a session identifier.";
    if (!isset($_SESSION['csrf_token']) || $_SESSION['csrf_token'] !== $csrf) {
        $errors[] = "You do not have permission to perform that action.";
    }
    
    if (empty($errors)) {
        $customerData = new StdClass;
        $customerData->action = $action;
        $customerData->session = $session;
        
        $modelObjects = new StdClass;
        $modelObjects->init = $init;

        $storage = new SplObjectStorage();
        $storage->attach($customerData, 'customerData');
        $storage->attach($modelObjects, 'modelObjects');
        $controller = new DestroySessionController($storage);
        echo json_encode($controller);
    }
}
