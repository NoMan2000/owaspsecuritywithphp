<?php

namespace security\Models\Login;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Interfaces\CustomerType;
use \security\Models\Login\BaseLogin;
use \stdClass;

class BadCustomerLogin extends BaseLogin implements CustomerType
{
    private $username;
    private $password;

    public function __construct(stdClass $models, stdClass $customerData)
    {
        parent::__construct($models);
        $this->userName = $customerData->userName;
        $this->password = $customerData->password;
    }
    public function checkCustomerLogin()
    {
        $userName = $this->userName;
        $password = $this->password;
        $pdo = $this->pdo;
        $dev = $this->isDev();
        $errors = [];
        $hasUserName = false;
        $query = "SELECT id, username, plainpassword FROM customers WHERE username = '$userName'";
        $result = $pdo->query($query);
        $pdoError = $pdo->errorInfo();
        if (isset($pdoError[2])) {
            $errors[] = $pdoError[2];
        }
        if (is_object($result)) {
            $row = $result->fetch(PDO::FETCH_ASSOC);
            $resultPassword = $row['plainpassword'];
            $isCorrectPassword = $password === $resultPassword;

            if ($isCorrectPassword) {
                $userid = $row['id'];
                $_SESSION['customerid'] = $row['id'];
                $_SESSION['isauthenticated'] = true;
                $_SESSION['customerType'] = CustomerType::CUSTOMER;
                $this->data['userid'] = $userid;
                return $this->data;
            }
            if (!$isCorrectPassword) {
                if ($dev) {
                    $errors[] = "Customer bad login.";
                }
                $errors[] = "Your user account could not be accessed.  Try again.";
            }
        }
        if (!empty($errors)) {
            $this->runErrors($errors);
        }
    }
    protected function runErrors(array $errors)
    {
        $this->errorRunner->runErrors($errors);
    }
}
