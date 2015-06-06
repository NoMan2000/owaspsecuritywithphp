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
use \security\Models\Customers\EditCustomer;
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
    private $customer;
    private $customerData;

    public function __construct(stdClass $models, stdClass $customer)
    {
        $this->customer = new EditCustomer($models, $customer);
    }
    public function editCustomer()
    {
        $this->data = $this->customer->editCustomer($this->editData);
    }
    public function jsonSerialize()
    {
        return $this->data;
    }
}

$isAjax = (isset($isAjax) && $auth->isAjax()) ? true : false;

if ($isAjax) {
    // Add a PDOSingleton User here.
    $pdo = new PDOSingleton();
    $auth = new Authenticate();
    $errorRunner = new ErrorRunner();
    $logger = new FullLog('Customer Editing Account');
    $logger->serverData();
    $checkAuth = new CheckAuth($logger);
    $redis = new RedisSingleton();
    $errors = [];
    extract($_POST);

    $username = !empty($username) ?
    $auth->cleanString($username) : null;
    $password = !empty($password) ?
    $password : null;
    $newpassword = !empty($newpassword) ?
    $newpassword : null;
    $newpasswordConfirm = !empty($newpasswordConfirm) ?
    $newpasswordConfirm : null;
    $email = !empty($email) ?
    $auth->vEmail($email) : null;
    $address = !empty($address) ?
    $auth->cleanString($address) : null;
    $phone = !empty($phone) ?: null;
    $city = !empty($city) ?
    $auth->cleanString($city) : null;
    $state = !empty($state) ?
    $auth->cleanString($state) : null;
    $countryCode = !empty($countryCode) ?
    $auth->cleanString($countryCode) : null;
    $zip = !empty($zip) ?
    $auth->cleanString($zip) : null;

    $csrf = !empty($csrf) ? $csrf : null;
    if ($phone) {
        $phone = $auth->vPhone($phone) ?: $errors[] = "Invalid phone format.";
    }

    $instructions = !empty(trim($instructions)) ?
    $auth->cleanString($instructions) : null;
    $isCustomer = $checkAuth->isCustomer();
    $updatePassword = false;

    $username || $errors[] = "No username was sent over.";
    $email || $errors[] = "No password was sent over.";
    $address || $errors[] = "No address was sent over.";
    $phone || $errors[] = "No phone number was sent over.";
    $csrf || $errors[] = "No token sent on request.";
    $isCustomer || $errors[] = "Not a valid customer.";

    $passwordLen = strlen($password);
    $newpasswordLen = strlen($newpassword);

    if ($newpassword !== $newpasswordConfirm) {
        $errors[] = "The new password and the old password must match.";
    }
    if ($newpasswordLen > 0 && $newpasswordLen < 8) {
        $errors[] = "The new password must be at least 8 characters long.";
    }
    if ($newpasswordLen > 0 && $passwordLen === 0) {
        $errors[] = "You must fill in the old password to update the new one!";
    }
    if ($newpasswordLen > 0) {
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
        $updatePassword = true;
    }
    if ($csrf !== $_SESSION['csrf_token']) {
        $errors[] = "This form does not appear to have originated from our site.";
    }
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
    $customerData['city'] = $city;
    $customerData['state'] = $state;
    $customerData['countryCode'] = $countryCode;
    $customerData['zip'] = $zip;
    $customerData['updatePassword'] = $updatePassword;
    $customer = new stdClass();
    $customer->customerData = $customerData;

    if (empty($errors)) {
        $editCustomer = new EditCustomerController($models, $customer);
        $editCustomer->editCustomer();
        if (!$isAjax) {
            echo json_encode($editCustomer);
        }
        if (!$isAjax) {
            // Do something else
        }
    }
}
if (!empty($errors)) {
    $errorRunner->runErrors($errors);
}
