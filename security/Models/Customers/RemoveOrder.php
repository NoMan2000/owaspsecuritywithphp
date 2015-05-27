<?php

namespace security\Models\Customers;

use \PDO;
use \security\Interfaces\FullLogInterface;
use \security\Models\ErrorRunner;
use \security\Traits\IsDevelopment;

class RemoveOrder
{
    use IsDevelopment;
    private $errors = [];
    private $orderID;
    private $customerID;
    private $pdo;
    private $errorRunner;
    private $data;

    public function __construct($customerID, $orderID, PDO $pdo, ErrorRunner $errorRunner, FullLogInterface $logger)
    {
        $this->customerID = $customerID;
        $this->orderID = $orderID;
        $this->pdo = $pdo;
        $this->errorRunner = $errorRunner;
        $this->logger = $logger;
    }
    public function removeOrder()
    {
        $errors = $this->errors;
        $pdo = $this->pdo;
        $customerID = $this->customerID;
        $orderID = $this->orderID;
        $query = "DELETE FROM orders WHERE customers_id = :customerid AND id = :orderid";
        $stmt = $pdo->prepare($query);
        if (!$stmt) {
            $errors[] = "Unable to delete this record.";
            $this->logger->addCritical("Unable to delete order number $orderID for customer $customerID");
        }
        $stmt->bindParam(':customerid', $customerID, PDO::PARAM_INT);
        $stmt->bindParam(':orderid', $orderID, PDO::PARAM_INT);
        $success = $stmt->execute();
        $errorInfo = $stmt->errorInfo();
        if (isset($errorInfo[2]) && $this->isDev()) {
            $errors[] = $errorInfo[2];
        }

        if (!$success) {
            $errors[] = "Unable to delete this record.";
        }
        if ($success) {
            $deletedNumber = $stmt->rowCount();
            if (!$deletedNumber) {
                $errors[] = "No rows were updated.";
            }
            if ($deletedNumber) {
                $this->data = [
                    "id" => $orderID,
                    "numberRemoved" => "Removed the following number of orders: $deletedNumber",
                ];

                return $this->data;
            }
        }
        if (!empty($errors)) {
            $this->errorRunner->runErrors($errors);
        }
    }
}
