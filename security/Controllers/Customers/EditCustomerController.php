<?php

namespace security\Controllers\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \InvalidArgumentException;
use \PDO;
use \Redis;
use \security\Controllers\Customers\BaseCustomerController;
use \security\Exceptions\KnownVulnerablePasswordException;
use \security\Exceptions\WeakPasswordException;
use \security\Models\Authenticator\Authenticate;
use \security\Models\Authenticator\CheckAuth;
use \security\Models\ErrorRunner;
use \security\Models\Login\PasswordVulnerable;
use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\SiteLogger\FullLog;
use \stdClass;

class EditCustomerController extends BaseCustomerController
{
    private $editData = [];
    private $errors = [];

    public function __construct(stdClass $models, array $customerData)
    {
        $this->customerData = $customerData;
        $this->customer = new UpdateCustomer($models);
    }
    public function updateCustomer()
    {
        $this->data = $this->customer->updateCustomer($this->editData);
    }
    public function jsonSerialize()
    {
        return $this->data;
    }
}

$pdo = new PDOSingleton();
$auth = new Authenticate();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Editing Account');
$logger->serverData();
$checkAuth = new CheckAuth($logger);
$redis = new RedisSingleton();
$errors = [];
$username = !empty($_POST['username']) ?
$auth->cleanString($_POST['username']) : null;
$password = !empty($_POST['password']) ?
$_POST['password'] : null;
$newpassword = !empty($_POST['newpassword']) ?
$_POST['newpassword'] : null;
$newpasswordConfirm = !empty($_POST['newpasswordConfirm']) ?
$_POST['newpasswordConfirm'] : null;
$email = !empty($_POST['email']) ?
$auth->vEmail($_POST['email']) : null;
$address = !empty($_POST['address']) ?
$auth->cleanString($_POST['address']) : null;
$phone = !empty($_POST['phone']) ?
$auth->vPhone($_POST['phone']) : null;
$csrf = !empty($_POST['csrf']) ? $csrf : null;

if ($phone) {
    $phone = $auth->cInt($_POST['phone']);
}
$instructions = !empty(trim($_POST['instructions'])) ?
$auth->cleanString($_POST['instructions']) : null;
$action = !empty($_POST['action']) ?
$auth->cleanString($_POST['action']) : null;
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
} catch (KnownVulnerablePasswordException $e) {
    $errors[] = $e->getMessage();
} catch (WeakPasswordException $e) {
    $errors[] = $e->getMessage();
} catch (InvalidArgumentException $e) {
    $errors[] = $e->getMessage();
}

if ($csrf !== $_SESSION['csrf_token']) {
    $errors[] = "This form does not appear to have originated from our site.";
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

    $customerData = [];
    $customerData['username'] = $username;
    $customerData['password'] = $password;
    $customerData['newpassword'] = $newpassword;
    $customerData['email'] = $email;
    $customerData['address'] = $address;
    $customerData['phone'] = $phone;
    $customerData['instructions'] = $instructions;
    $customerData['session'] = $_SESSION;
    $customerData['action'] = $action;

    $editCustomer = new EditCustomerController($models, $customerData);
    $editCustomer->updateCustomer();
    if ($isAjax) {
        echo json_encode($editCustomer);
    }
}
