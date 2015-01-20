<?php

namespace security\Models\Customers;

use \PDO;
use \StdClass;
use \security\Models\ErrorRunner;
use \security\Models\FileUploader\FileUploader;
use \security\Models\Login\EmailConfirmAccount;
use \security\Exceptions\FolderException;
use \security\Interfaces\Seconds;
use \security\Interfaces\FullLogInterface;
use \security\Models\Authenticator\BlackLister;
use \Redis;
use \Rhumsaa\Uuid\Uuid;
use \Rhumsaa\Uuid\Exception\UnsatisfiedDependencyException;

class AddNewCustomer implements Seconds
{
    private $errors = [];
    private $orderID;
    private $customerID;
    private $pdo;
    private $errorRunner;
    private $data;
    
    public function __construct(array $customerData, PDO $pdo, Redis $redis, ErrorRunner $errorRunner, BlackLister $blacklist, FullLogInterface $logger)
    {
        $this->customerData = $customerData;
        $this->pdo = $pdo;
        $this->redis = $redis;
        $this->errorRunner = $errorRunner;
        $this->blacklist = $blacklist;
        $this->logger = $logger;
    }
    public function addNewCustomer()
    {
        $errors = $this->errors;
        $pdo = $this->pdo;
        $redis = $this->redis;
        $username = $this->customerData['username'];
        $passwordUnmodified = $password =  $this->customerData['password'];
        $email = $this->customerData['email'];
        $address = $this->customerData['address'];
        $phone = $this->customerData['phone'];
        $instructions = $this->customerData['instructions'];
        $upload = $this->customerData['upload'];
        
        $sql = 'SELECT username, email, address, phone FROM customers WHERE username = :username OR email = :email OR 
        address = :address OR phone = :phone';
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->bindParam(":email", $email, PDO::PARAM_STR);
        $stmt->bindParam(':address', $address, PDO::PARAM_STR);
        $stmt->bindParam(":phone", $phone, PDO::PARAM_STR);
        $stmt->execute();
        $errorInfo = $stmt->errorInfo();
        if (isset($errorInfo[2]) && $this->isDev()) {
            $errors[] = $errorInfo[2];
            $this->logger->addCritical("Unable to Add new user because {$errorInfo[2]}.");
        }
        
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

            $errors[] = "This username, email, phone, or address already exists.";
            $sleep = $this->blacklist->setSleeper("username:$username");
            $logInfo = [];
            $row['username'] === $username ? $logInfo[] = "This username is already in use." : null; 
            $row['email'] === $email ? $logInfo[] = "This email is already in use." : null;
            $row['address'] === $address ? $logInfo[] = "This address is already in use." : null;
            $row['phone'] === $phone ? $logInfo[] = "This phone number is already in use." : null;
            $logString = implode($logInfo);
            $this->logger->addWarning("The following were attempted at accessing: $logString");
            if ($this->isDev()) {
                $errors[] = "Sleeping for $sleep";
            }
        }
        if (!$row && empty($errors)) {
            $password = password_hash($password, PASSWORD_DEFAULT);
            $sql = "INSERT INTO customers SET 
                    username = :username,
                    plainpassword = :plainpassword, 
                    password = :password,
                    email = :email,
                    address = :address,
                    phone = :phone,
                    instructions = :instructions";
            $stmt = $pdo->prepare($sql);
            $bindings = [
                ":username" => $username,
                ":plainpassword" => $passwordUnmodified,
                ":password" => $password,
                ":email" => $email,
                ":address" => $address,
                ":phone" => $phone,
                ":instructions" => $instructions
            ];
            $result = $stmt->execute($bindings);    
            if ($result) {
                if (!is_null($upload)) {
                    $this->setUploads();
                }
                $id = $pdo->lastInsertId();
                $uniqueID = Uuid::uuid4();

                $redis->set($uniqueID, $id);
                $redis->expire($uniqueID, Seconds::DAY);
                $this->blacklist->removeSleeper("username:$username");
                // Adding a class directly in a method is a bad practice, so mark this as a refactor.
                $emailAccount = new EmailConfirmAccount($email, $uniqueID);
                $this->data["s"] = [
                    "success"=>"Successfully created a new customer.  This will not be active until you 
                        activate your email.  It expires in 24 hours."
                ];
            return $this->data;
            }
            if (!$result) {
                $errorInfo = $stmt->errorInfo();
                if (isset($errorInfo[2]) && $this->isDev()) {
                    $errors[] = $errorInfo[2];
                    $this->logger->addCritical("Unable to Add new user because {$errorInfo[2]}.");
                }
                $this->logger->addWarning("Unable to add new user $username.");
                $errors[] = "Unable to add the customer.  Contact support.";
            }
        }
        if (!empty($errors)) {
            $this->errorRunner->runErrors($errors);
        }
    }
    public function setUploads() 
    {
    	$destination = '/home/ubuntu/workspace/public/uploads/';
    	try {
        	$upload = new FileUploader($destination, $this->customerData['files']);
        	$upload->setMaxSize($this->customerData['MAX_FILE_SIZE']);
        	$upload->upload();
        	$result = $upload->getMessages();
        	$result = implode($result);
        	$this->data['r'] = ['uploadResults'=>$result];
        } catch (FolderException $e) {
        	$this->errors[] = $e->getMessage();
        }
        $error = error_get_last();
        if (!empty($error)) {
            $this->errors['type'] = $error['type'];
            $this->errors['message'] = $error['message'];
            $this->errors['file'] = $error['file'];
            $this->errors['line'] = $error['line'];
        }
        if (!empty($this->errors)) {
            $this->errorRunner->runErrors($this->errors);
        }
    }
}
