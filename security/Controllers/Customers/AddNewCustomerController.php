<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \JsonSerializable;
use \PDO;
use \Redis;
use \security\Interfaces\FullLogInterface;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\BlackLister;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\AddNewCustomer;
use \security\Controllers\Customers\BaseCustomerController;
use \security\Models\ErrorRunner;
use \security\Models\Login\PasswordVulnerable;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\SiteLogger\FullLog;
use \stdClass;

class AddNewCustomerController extends BaseCustomerController
{
    private $customerData = [];
    private $errors = [];

    public function __construct(stdClass $models, stdClass $customerData)
    {
        parent::__construct($models);
        $this->customerData = $customerData;
        $this->constructObjects();
        $this->newCustomer = new AddNewCustomer(
            $this->pdo,
            $this->redis,
            $this->errorRunner,
            $this->blackList,
            $this->logger
        );
        $this->switchAction;
    }

    protected function constructObjects()
    {
        parent::constructObjects();
        $this->customer['username'] = $this->customerData->username;
        $this->customer['password'] = $this->customerData->password;
        $this->customer['email'] = $this->customerData->email;
        $this->customer['address'] = $this->customerData->address;
        $this->customer['phone'] = $this->customerData->phone;
        $this->customer['instructions'] = $this->customerData->instructions;
        $this->customer['files'] = $this->customerData->files;
        $this->customer['MAX_FILE_SIZE'] = $this->customerData->MAX_FILE_SIZE;
        $this->customer['upload'] = $this->customerData->upload;
        $this->action = $this->customerData->action;
        unset($this->customerData);
        unset($this->models);
    }

    public function switchAction()
    {
        $action = $this->action;
        switch ($action) {
            case 'addNewCustomer':
                $this->data = $this->newCustomer->addNewCustomer($this->customer);
                break;
        }
    }
}

$pdo = new PDOSingleton(PDOSingleton::CUSTOMERUSER);
$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Add New Customer Form');
$logger->serverData();
$checkAuth = new CheckAuth($logger);
$redis = new RedisSingleton();
$error = error_get_last();
$errors = [];

$files = $MAX_FILE_SIZE = $upload = null;
if (isset($_POST['upload']) && $_POST['upload'] === 'true') {
    $files = $_FILES;
    $upload = true;
    $MAX_FILE_SIZE = $_POST['MAX_FILE_SIZE'];
}

$username = !empty($_POST['username']) ?
    $auth->cleanString($_POST['username']) : null;
$password = !empty($_POST['password']) ?
    $_POST['password'] : null;
$email = !empty($_POST['email']) ?
    $auth->vEmail($_POST['email']) : null;
$address = !empty($_POST['address']) ?
    $auth->cleanString($_POST['address']) : null;
$phone = !empty($_POST['phone']) ?
    $auth->vPhone($_POST['phone']) : null;
$stop = !empty($_POST['stop']) ? true : false;
$potentialAbuse = isset($_POST['potentialAbuse']) ?
    $auth->cInt($_POST['potentialAbuse']) : null;
if ($stop) {
    return false;
}
if ($phone) {
    $phone = $auth->cInt($_POST['phone']);
}
$instructions = !empty(trim($_POST['instructions'])) ?
    $auth->cleanString($_POST['instructions']) : null;
$action = !empty($_POST['action']) ?
    $auth->cleanString($_POST['action']) : null;

$username || $errors[] = "No username was sent over.";
$email || $errors[] = "No email was sent over.";
$address || $errors[] = "No address was sent over.";
$phone || $errors[] = "No phone number was sent over.";
$action || $errors[] = "No action was sent over, do not have enough information.";
$password || $errors[] = "No password was sent over.";
$passLen = strlen($password);

if ($passLen > 0 && $passLen < 8) {
    $errors[] = "The new password must be at least 8 characters long.";
}
$passwordCheck = new PasswordVulnerable($password);
try {
    $passwordCheck->isNotVulnerable();
} catch (KnownVulnerablePasswordException $e) {
    $errors[] = $e->getMessage();
} catch (WeakPasswordException $e) {
    $errors[] = $e->getMessage();
} catch (InvalidArgumentException $e) {
    $errors[] = $e->getMessage();
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
if (empty($errors)) {
    $models = new stdClass();
    $models->pdo = $pdo;
    $models->redis = $redis;
    $models->errorRunner = $errorRunner;
    $models->logger = $logger;

    $customerData = new stdClass();
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

    $addNewCustomer = new AddNewCustomerController($models, $customerData);
    $addNewCustomer->switchAction();
    if ($isAjax) {
        echo json_encode($addNewCustomer);
    }
}
