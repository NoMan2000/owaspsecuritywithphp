<?php

namespace security\Models\Login;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Interfaces\CustomerType;
use \security\Models\Authenticator\PasswordCheck;
use \security\Models\ErrorRunner;
use \security\Traits\IsDevelopment;
use \stdClass;

class CustomerLogin implements CustomerType
{
    use IsDevelopment;
    private $username;
    private $password;
    private $errorRunner;
    private $pdo;
    private $data = [];

    public function __construct(stdClass $models)
    {
        parent::__construct($models);
        parent::setObjects();
    }
    public function checkUser($username, $password)
    {
        $dev = $this->isDev();
        $this->errorRunner = $errorRunner;
        $sql = 'SELECT id, username, password FROM customers WHERE username = :username';
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->execute();
        $errorInfo = $stmt->errorInfo();
        if (isset($errorInfo[2]) && $dev) {
            $this->errors[] = $errorInfo[2];
        }
        // Mysql returns the number of results fetched as an integer, but SQLite does not.
        // This check makes the code more portable.
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!$row) {
            $blackList->blackList();
            $this->errors[] = "Could not access account.  Try again.";
        }
        if ($row) {
            $resultPassword = $row['password'];
            $isCorrectPassword = password_verify($password, $resultPassword);
            if (!$isCorrectPassword) {
                // for older systems.
                $isCorrectPassword = md5($password) == $resultPassword;
                // functionally equivalent.  Password verify has the algorithm and cost in the beginning,
                // this is for md5.
                $isCorrectPassword = password_verify('$1$' . $password, $resultPassword);
            }

            if ($isCorrectPassword) {
                $passwordHasher = new PasswordCheck($password);
                if ($passwordHasher->needsNewHash()) {
                    $password = $passwordHasher->makeHash();
                    $query = "UPDATE customers SET password='$password' WHERE username = :username";
                    $update = $pdo->prepare($query);
                    $update->bindParam(':username', $username, PDO::PARAM_STR);
                    $update->execute();
                }

                $blackList->removeBlackList();
                $blackList->removeSleeper("$username:{$row['username']}");
                // Careful when using session_regenerate_id true.  This calls session_destroy.
                session_regenerate_id(true);
                $userid = $row['id'];
                $_SESSION['customerid'] = $row['id'];
                $_SESSION['isauthenticated'] = true;
                $_SESSION['customerType'] = CustomerType::CUSTOMER;
                $this->data['userid'] = $userid;
                return $this->data;
            }
            if (!$isCorrectPassword) {
                $sleep = $blackList->setSleeper("$username:{$row['username']}");
                if ($dev) {
                    $this->errors[] = "Sleeping for $sleep.";
                }
                $this->errors[] = "Could not access account.  Try again.";
            }
        }
        $this->checkErrors();
    }
    protected function checkErrors()
    {
        if (!empty($this->errors)) {
            $this->errorRunner->runErrors($this->errors);
        }
    }
}
