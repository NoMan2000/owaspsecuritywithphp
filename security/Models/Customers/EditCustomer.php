<?php

namespace security\Models\Customers;

require_once(dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php');

use \PDO;
use \security\Models\ErrorRunner;
use \security\Models\Interfaces\FullLogInterface;
use \security\Traits\IsDevelopment;
use \security\Models\Customers\BaseCustomer;

class EditCustomer extends BaseCustomer
{
    use IsDevelopment;
    private $errors = [];
    private $orderID;
    private $customerID;
    private $pdo;
    private $errorRunner;
    private $data;

    public function __construct(stdClass $models)
    {
        parent::__construct($models);
    }
    public function updateCustomer(array $customerData)
    {
        $this->customerData = $customerData;
        $errors = $this->errors;
        $pdo = $this->pdo;
        $session = $this->customerData['session'];
        $username = $this->customerData['username'];
        $password = $this->customerData['password'];
        $newpasswordUnmodified = $newpassword = $this->customerData['newpassword'];
        $email = $this->customerData['email'];
        $address = $this->customerData['address'];
        $phone = $this->customerData['phone'];
        $instructions = $this->customerData['instructions'];

        $customerID = $session['customerid'];

        $sql = 'SELECT id, username, password FROM customers WHERE id = :customerID';
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':customerID', $customerID, PDO::PARAM_INT);
        $stmt->execute();
        $errorInfo = $stmt->errorInfo();
        if (isset($errorInfo[2])) {
            $errors[] = "Unable to update account.  Contact support.";
            if ($this->isDev()) {
                $errors[] = $errorInfo[2];
                $this->logger->addWarning("Unable to update account for $username");
            }
        }

        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($row) {
            $resultPassword = $row['password'];
            $isCorrectPassword = password_verify($password, $resultPassword);
            if ($isCorrectPassword) {
                $newpassword = password_hash($newpassword, PASSWORD_DEFAULT);
                $sql = "UPDATE customers SET
                        username = :username,
                        plainpassword = :plainpassword,
                        password = :newpassword,
                        email = :email,
                        address = :address,
                        phone = :phone,
                        instructions = :instructions
                        WHERE id = :customerID";
                $stmt = $pdo->prepare($sql);
                // The only downside to this sort of execution is that all parameters are bound as
                // as string parameters.
                $bindings = [
                    ":username" => $username,
                    ":plainpassword" => $newpasswordUnmodified,
                    ":newpassword" => $newpassword,
                    ":email" => $email,
                    ":address" => $address,
                    ":phone" => $phone,
                    ":instructions" => $instructions,
                    ":customerID" => $customerID,
                ];
                $result = $stmt->execute($bindings);
                if ($result) {
                    $this->data = [
                        "success" => "Successfully updated the customer.",
                    ];
                    return $this->data;
                }
                if (!$result) {
                    $errorInfo = $stmt->errorInfo();
                    if (isset($errorInfo[2]) && $this->isDev()) {
                        $errors[] = $errorInfo[2];
                        $errors[] = $bindings;
                    }
                    $errors[] = "Unable to update the customer.  Contact support.";
                }
            }
        }
        if (!$row) {
            $this->logger->addWarning("Unable to find account info for $username");
            $errors[] = "Unable to update the customer.  Contact support.";
        }

        if (!empty($errors)) {
            $this->errorRunner->runErrors($errors);
        }
    }
}
