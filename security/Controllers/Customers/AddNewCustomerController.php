<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \Redis;
use \security\Controllers\Customers\BaseCustomerController;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\Customers\AddNewCustomer;
use \security\Models\ErrorRunner;
use \security\Models\Login\PasswordVulnerable;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\SiteLogger\FullLog;
use \stdClass;

class AddNewCustomerController extends BaseCustomerController
{
    private $customerData = [];
    private $models;
    private $newCustomer;

    public function __construct(stdClass $models, stdClass $customer)
    {
        $this->customerData = $customerData;
        $this->newCustomer = new AddNewCustomer($models, $customer);
    }
    public function addNewCustomer()
    {
        $this->data = $this->newCustomer->addNewCustomer();
    }
}

if (isset($_POST['submit']) || isset($_GET['submit'])) {
    extract($_POST);
    extract($_GET);
    $isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;
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
    if (isset($upload) && $upload === 'true') {
        $files = $_FILES;
        $upload = true;
        $MAX_FILE_SIZE = $MAX_FILE_SIZE;
    }

    $username = !empty($username) ? $auth->cleanString($username) : null;
    $password = !empty($password) ? $password : null;
    $email = !empty($email) ? $auth->vEmail($email) : null;
    $address = !empty($address) ? $auth->cleanString($address) : null;
    $phone = !empty($phone) ? $auth->vPhone($phone) : null;
    $stop = !empty($stop) ? true : false;
    $potentialAbuse = isset($potentialAbuse) ? $auth->cInt($potentialAbuse) : null;
    if ($stop) {
        return false;
    }

    $instructions = !empty(trim($instructions)) ? $auth->cleanString($instructions) : null;
    $action = !empty($action) ? $auth->cleanString($action) : null;

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
    $models = new stdClass();
    $models->pdo = $pdo;
    $models->redis = $redis;
    $models->errorRunner = $errorRunner;
    $models->logger = $logger;

    $customer = new stdClass();

    $customerData = [];
    $customerData['username'] = $username;
    $customerData['password'] = $password;
    $customerData['email'] = $email;
    $customerData['address'] = $address;
    $customerData['phone'] = $phone;
    $customerData['instructions'] = $instructions;
    $customerData['action'] = $action;
    $customerData['files'] = $files;
    $customerData['MAX_FILE_SIZE'] = $MAX_FILE_SIZE;
    $customerData['upload'] = $upload;
    if ($potentialAbuse > 1) {
        // Set a sleep timer to delay execution if potential abuse.
        $sleepTime = pow(2, $potentialAbuse);
        sleep($sleepTime);
    }
    $customer->customerData = $customerData;

    $addNewCustomer = new AddNewCustomerController($models, $customer);
    $addNewCustomer->addNewCustomer();
    if ($isAjax) {
        echo json_encode($addNewCustomer);
    }
}

if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
