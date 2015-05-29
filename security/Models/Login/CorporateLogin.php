<?php

namespace security\Models\Login;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Interfaces\CustomerType;
use \security\Models\Login\BaseLogin;
use \stdClass;

class CorporateLogin extends BaseLogin implements CustomerType
{
    protected $errors = [];
    
    public function __construct(stdClass $models)
    {
        parent::__construct($models);
    }

    public function checkUser($username, $password)
    {
        $this->errorRunner = $errorRunner;
        $sql = 'SELECT id, company_id, group_id, username, is_admin, is_locked, attempts,
                password FROM users WHERE username = :username';
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->execute();
        $errorInfo = $stmt->errorInfo();
        if (isset($errorInfo[2]) && $this->isDev()) {
            $this->errors[] = $errorInfo[2];
        }
        // Mysql returns the number of results fetched as an integer, but SQLite does not.
        // This check makes the code more portable.
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!$row) {
            $blackList->blackList();
            if ($this->isDev()) {
                $this->errors[] = $sql;
            }
            $this->errors[] = "Invalid Attempt.";
        }
        if ($row && !$row['is_locked']) {
            $resultPassword = $row['password'];
            $isCorrectPassword = password_verify($password, $resultPassword);
            if ($isCorrectPassword) {
                $blackList->removeBlackList();
                $blackList->removeSleeper("corporateuser:{$row['username']}");
                $userid = $row['id'];
                $_SESSION['corporateid'] = $row['company_id'];
                $_SESSION['is_admin'] = $row['is_admin'];
                $_SESSION['groupid'] = $row['group_id'];
                $_SESSION['isauthenticated'] = true;
                $_SESSION['customerType'] = CustomerType::CORPORATE;
                $this->data['userid'] = $userid;
                return $this->data;
            }
            if (!$isCorrectPassword) {
                $attempts = $row['attempts'] + 1;
                $is_locked = $attempts === 100 ? 1 : 0;
                $logger->addWarning("{$row['username']} failed to login.  Now at $attempts.");
                $sleep = $blackList->setSleeper("corporateuser:{$row['username']}");
                if ($this->isDev()) {
                    $errors[] = "Sleeping for $sleep";
                }
                $query = "UPDATE users SET attempts = $attempts, is_locked=$is_locked
                          WHERE username = :username";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':username', $username, PDO::PARAM_STR);
                $stmt->execute();
                $this->errors[] = "Invalid Attempt.";
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
