<?php

namespace security\Controllers\Customers;

require_once(dirname(dirname(dirname(__DIR__))). DIRECTORY_SEPARATOR . 'public/init.php');

use \security\Models\PDOSingleton;
use \PDO;
use \security\Models\Authenticator\Authenticate;
use \security\Models\ErrorRunner;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\SiteLogger\FullLog;
use \security\Interfaces\FullLogInterface;
use \SplObjectStorage;
use \StdClass;
use \JsonSerializable;
use \security\Models\Customers\RemoveOrder;

$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Remove Order');
$logger->serverData();
$checkAuth = new CheckAuth($logger);
$errors = [];

class RemoveOrderController implements JsonSerializable
{
    private $customerID;
    private $orderID;
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
                $this->setCustomerID($object->customerID)
                     ->setOrderID($object->orderID)
                     ->setAction($object->action);
                 break;
            case 'modelObjects':
                $this->setPDO($object->pdo)
                     ->setErrorRunner($object->errorRunner)
                     ->setLogger($object->logger);
                break;
        }
    }
    protected function setCustomerID($customerID)
    {
        $this->customerID = $customerID;
        return $this;
    }
    protected function setOrderID($orderID)
    {
        $this->orderID = $orderID;
        return $this;
    }
    protected function setAction($action)
    {
        $this->action = $action;
        return $this;
    }
    protected function setPDO(PDO $pdo)
    {
        $this->pdo = $pdo;
        return $this;
    }
    protected function setErrorRunner(ErrorRunner $errorRunner)
    {
        $this->errorRunner = $errorRunner;
        return $this;
    }
    protected function setLogger(FullLogInterface $logger)
    {
        $this->logger = $logger;
        return $this;
    }
    protected function switchAction()
    {
        $action = $this->action;
        switch($action){
            case 'removeOrder':
                $remove = new RemoveOrder(
                    $this->customerID, 
                    $this->orderID, 
                    $this->pdo, 
                    $this->errorRunner,
                    $this->logger
                );
                $this->data = $remove->removeOrder();
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
    $orderID = $auth->filledAndSet(@$_POST['id']) ? $auth->cInt($_POST['id']) : null;
    $isCustomer = $checkAuth->isCustomer();
    $customerID = $auth->filledAndSet(@$_SESSION['customerid']) ? $auth->cInt($_SESSION['customerid']) : null;
    
    if (is_null($action) || is_null($orderID) || is_null($customerID) || !$isCustomer) {
        $action || $errors[] = "No action was specified on this request.";
        $orderID || $errors[] = "No orderid was specified on this request.";
        $customerID || $errors[] = "No customer id.  You have most likely timed out.  Log out and log back in.";
        $isCustomer || $errors[] = "You are not authenticated as a customer.";
    }
    $csrf = $auth->filledAndSet(@$_POST['csrf']) ? $_POST['csrf'] : null;
    if (!$_SESSION['csrf_token'] || $_SESSION['csrf_token'] !== $csrf) {
        $errors[] = "This form does not appear to have originated from our site.";
    }
    
    if (empty($errors)) {
        $customerData = new StdClass;
        $customerData->action = $action;
        $customerData->orderID = $orderID;
        $customerData->customerID = $customerID;
        
        $modelObjects = new StdClass;
        $modelObjects->pdo = $pdo;
        $modelObjects->errorRunner = $errorRunner;
        $modelObjects->logger = $logger;
    
        $storage = new SplObjectStorage();
        $storage->attach($customerData, 'customerData');
        $storage->attach($modelObjects, 'modelObjects');
        $controller = new removeOrderController($storage);
        echo json_encode($controller);
    }
    
}
