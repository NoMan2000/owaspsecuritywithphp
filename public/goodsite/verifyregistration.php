<?php

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'partials/header.php';

use \security\Models\PDOSingleton;
use \security\Models\RedisSingleton;
use \security\Models\SiteLogger\FullLog;

$redis = new RedisSingleton();
$pdo = new PDOSingleton();
$logger = new FullLog();
$errors = [];
$message = null;
$successClass = $errorClass = 'hide';
$errorString = '';

if (isset($_GET['uniq'])) {
    $uid = $_GET['uniq'];
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
            $successClass = null;
            $message = "Successfully verified new customer and email.  You can now login to the customer site.";
            $redis->del($uid);
        }
        if (!$changed) {
            $errors[] = "No updated occurred.";
        }
    }
    if (!$id) {
        $errors[] = "Unable to find user ID.  Make sure no extra spaces or lines were carried over.";
    }
}
if (!isset($_GET['uniq'])) {
    $errors[] = "This is not meant to be accessed unless confirming a new account.";
}

if (!empty($errors)) {
    $errorClass = null;
    foreach ($errors as $error) {
        $errorString .= $error . "<br/>";
    }
}
?>

<header>
    <img src='../images/widgetCorp.png' alt='Widget Corp' id='headerImage'/>
</header>
    <section class="container-fluid row">
    <div id='content' class='clearfix col-xs-12
      col-sm-offset-3 col-md-offset-3 col-lg-offset-3
      col-sm-6 col-md-6 col-lg-6'>
        <div id='successHolder' class="alert alert-success <?=$successClass;?>" role="alert">
            <div id='successContent'><?=$message;?></div>
        </div>
        <div id='errorHolder' class="alert alert-danger <?=$errorClass;?>" role="alert">
            <div id='errorContent'><?=$errorString;?></div>
        </div>
    </div>
</section>

<?php
require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'partials/footer.php';
