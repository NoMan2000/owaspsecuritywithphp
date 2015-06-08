<?php

namespace security\Models\Customers;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'public/init.php';

use \PDO;
use \security\Models\Customers\BaseCustomer;
use \stdClass;

class ViewOrders extends BaseCustomer
{
    private $errors = [];
    private $customerID;

    public function __construct(stdClass $models, stdClass $orderData)
    {
        parent::__construct($models);
        $this->customerID = $orderData->customerID;
    }
    public function viewOrders()
    {
        $data = [];
        $errors = $this->errors;
        $pdo = $this->pdo;
        $customerID = $this->customerID;
        $query = "SELECT o.id, o.fulfilled, o.unfulfilled FROM orders AS o
                  JOIN customersToOrders AS c ON o.id = c.orders_id
                  WHERE c.customers_id = :customerID";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':customerID', $customerID, PDO::PARAM_INT);
        $success = $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($data)) {
            return $data;
        }
        $errorInfo = $stmt->errorInfo();
        if (isset($errorInfo[2]) && $this->isDev()) {
            $errors[] = $errorInfo[2];
            $this->logger->addCritical("Unable to view orders because {$errorInfo[2]}");
        }
        if (!empty($errors)) {
            $this->errorRunner->runErrors($errors);
        }
    }
}
