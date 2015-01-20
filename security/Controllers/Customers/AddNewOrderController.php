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
use \security\Models\Customers\AddNewOrder;

$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Remove Order');
$logger->serverData();
$checkAuth = new CheckAuth($logger);
$errors = [];

class AddNewOrderController implements JsonSerializable
{
    private $customerID;
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
                     ->setAction($object->action)
                     ->setTotalOrdered($object->totalOrdered);
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
    protected function setTotalOrdered($totalOrdered) 
    {
        $this->totalOrdered = $totalOrdered;
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
            case 'addOrder':
                $add = new AddNewOrder(
                    $this->customerID, 
                    $this->totalOrdered,
                    $this->pdo, 
                    $this->errorRunner,
                    $this->logger
                );
                $this->data = $add->addOrder();
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
    $customerID = $auth->filledAndSet(@$_SESSION['customerid']) ? $auth->cInt($_SESSION['customerid']) : null;
    $totalOrdered = $auth->filledAndSet(@$_POST['totalOrdered']) ? $auth->cInt($_POST['totalOrdered']) : null; 
    $csrf = $auth->filledAndSet(@$_POST['csrf']) ? $_POST['csrf'] : null;
    
    $action || $errors[] = "No action was specified on this request.";
    $customerID || $errors[] = "No customer id.  You have most likely timed out.  Log out and log back in.";
    $isCustomer || $errors[] = "You are not authenticated as a customer.";
    $totalOrdered || $errors[] = "No orders were sent over.";    
    $csrf || $errors[] = "This form does not appear to have originated from our site.";
    
    if (!isset($_SESSION['csrf_token']) || $csrf !== $_SESSION['csrf_token']) {
        $errors[] = "This form does not appear to have originated from our site.";
    }

    if (empty($errors)) {
        $customerData = new StdClass;
        $customerData->action = $action;
        $customerData->totalOrdered = $totalOrdered;
        $customerData->customerID = $customerID;
        
        $modelObjects = new StdClass;
        $modelObjects->pdo = $pdo;
        $modelObjects->errorRunner = $errorRunner;
        $modelObjects->logger = $logger;
    
        $storage = new SplObjectStorage();
        $storage->attach($customerData, 'customerData');
        $storage->attach($modelObjects, 'modelObjects');
        $controller = new AddNewOrderController($storage);
        echo json_encode($controller);
    }
    
}
