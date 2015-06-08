<?php

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'partials/header.php';

use \PDO;
use \PDOSingleton;
use \RedisSingleton;
use \security\Models\SiteLogger\FullLog;

$redis = new RedisSingleton();
$pdo = new PDOSingleton();
$logger = new FullLog();
$errors = [];

if (isset($_GET['uniq'])) {
    $uid = filter_var($_GET['uniq'], FILTER_SANITIZE_STRING);
    $id = $redis->get($uid);
    if ($id) {
        $query = "UPDATE customers SET verified = 1 WHERE id = :id";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $errorInfo = $stmt->errorInfo();
        if (isset($errorInfo[2])) {
            $errors[] = "No user matching the UID provided.";
            $logger->addCritical("Unable to Add new user because {$errorInfo[2]}.");
        }
        $changed = $stmt->rowCount();
        if ($changed) {
            echo "Successfully verified new customer and email.";
            $redis->del($uid);
        }
        if (!$changed) {
            $errors[] = "No updated occurred.";
        }
    }
}
$errors[] = "This is not meant to be accessed unless confirming a new account.";
if (!empty($errors)) {
    foreach ($errors as $error) {
        echo $error;
    }
}

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'partials/footer.php';
