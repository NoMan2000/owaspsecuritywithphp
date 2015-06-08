<?php

namespace security\Models\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Models\Customers\BaseCustomer;
use \stdClass;

class EditCustomer extends BaseCustomer
{
    private $errors = [];
    private $orderID;
    private $customerID;

    public function __construct(stdClass $models, stdClass $customer)
    {
        parent::__construct($models);
        $this->customerData = $customer->customerData;
    }
    public function editCustomer()
    {
        extract($this->customerData);
        $errors = $this->errors;
        $pdo = $this->pdo;
        $customerID = $session['customerid'];

        $sql = 'SELECT id, username, password
                FROM customers WHERE id = :customerID';
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
        if ($row && empty($errors)) {
            if ($updatePassword) {
                return $this->updatePassword($row, $this->customerData);
            }
            if (!$updatePassword) {
                return $this->updateCustomer($row, $this->customerData);
            }
        }
        if (!empty($errors)) {
            $this->errorRunner->runErrors($errors);
        }
    }
    /**
     * Todo:  The only two things we care about are the bindings and the
     * updated sql column, those can be pulled out and the rest of the
     * query remains the same.
     */
    protected function updatePassword(array $row, array $customerData)
    {
        $pdo = $this->pdo;
        $errors = [];
        extract($customerData);
        $customerID = $session['customerid'];
        $newpasswordUnmodified = $newpassword;
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
                    instructions = :instructions,
                    city = :city,
                    state = :state,
                    countryCode = :countryCode,
                    zip = :zip
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
                ":city" => $city,
                ":state" => $state,
                ":countryCode" => $countryCode,
                ":zip" => $zip,
                ":customerID" => $customerID,
            ];
            $result = $stmt->execute($bindings);
            if ($result) {
                return [
                    "success" => "Successfully updated the customer.",
                ];
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
        if (!$row) {
            $this->logger->addWarning("Unable to find account info for $username");
            $errors[] = "Unable to update the customer.  Contact support.";
        }
        if ($errors) {
            $this->errorRunner->runErrors($errors);
        }
    }
    protected function updateCustomer(array $row, array $customerData)
    {
        extract($customerData);
        $pdo = $this->pdo;
        $customerID = $session['customerid'];
        $errors = [];
        $sql = "UPDATE customers SET
                username = :username,
                email = :email,
                address = :address,
                phone = :phone,
                instructions = :instructions,
                city = :city,
                state = :state,
                countryCode = :countryCode,
                zip = :zip
                WHERE id = :customerID";
        $stmt = $pdo->prepare($sql);
        // The only downside to this sort of execution is that all parameters are bound as
        // as string parameters.
        $bindings = [
            ":username" => $username,
            ":email" => $email,
            ":address" => $address,
            ":phone" => $phone,
            ":instructions" => $instructions,
            ":city" => $city,
            ":state" => $state,
            ":countryCode" => $countryCode,
            ":zip" => $zip,
            ":customerID" => $customerID,
        ];
        $result = $stmt->execute($bindings);
        if ($result) {
            return [
                "success" => "Successfully updated the customer.",
            ];
        }
        if (!$result) {
            $errorInfo = $stmt->errorInfo();
            if (isset($errorInfo[2]) && $this->isDev()) {
                $errors[] = $errorInfo[2];
                $errors[] = $bindings;
            }
            $errors[] = "Unable to update the customer.  Contact support.";
        }
        if (!$row) {
            $this->logger->addWarning("Unable to find account info for $username");
            $errors[] = "Unable to update the customer.  Contact support.";
        }
        $this->errorRunner->runErrors($errors);
    }
}
