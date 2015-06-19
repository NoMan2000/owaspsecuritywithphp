<?php

require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/header.php";

use \security\Exceptions\FolderException;
use \security\Models\ErrorRunner;
use \security\Models\FileUploader\FileUploader;
use \security\Models\MySQLISingleton;
use \security\Models\RedisSingleton;
use \security\Models\Router\Router;
use \security\Models\SiteLogger\FullLog;

$router = new Router(__DIR__);
$rootPath = $router->rootPath;
$redis = new RedisSingleton();
$errorRunner = new ErrorRunner();
$logger = new FullLog('Customer Create Form');
$mysqli = new MySQLISingleton();

$_SESSION['maxfiles'] = ini_get('max_file_uploads');
$_SESSION['postmax'] = FileUploader::convertToBytes(ini_get('post_max_size'));
$_SESSION['displaymax'] = FileUploader::convertFromBytes($_SESSION['postmax']);

$max = 200 * 1024;
$errors = $usersExist = [];

if (isset($_POST['submitUsers'])) {
    $usersExist['users'] = [];
    $usersSearch = isset($_POST['usersSearch']) ? $_POST['usersSearch'] : null;
    if ($usersSearch) {
        $query = "SELECT username FROM customers WHERE username = '$usersSearch'";
        $res = $mysqli->query($query);
        if (!$res) {
            $errors[] = "On Query:<br/> [$query] <p>An Error Type of [{$mysqli->errno}] was generated.</p>
            <p>With a Message of: $mysqli->error on PHP line " . __LINE__ . " in file " . __FILE__ . "</p>";
        }
        if ($res) {
            foreach ($res as $row) {
                $usersExist['users'][] = $row;
            }
        }
    }
}

if (isset($_POST['submit'])) {

    $username = isset($_POST['inputUsername']) ? $_POST['inputUsername'] : null;
    $email = isset($_POST['inputEmail']) ? $_POST['inputEmail'] : null;
    $name = isset($_POST['inputName']) ? $_POST['inputName'] : null;
    $subject = isset($_POST['inputSubject']) ? $_POST['inputSubject'] : null;
    $message = isset($_POST['inputMessage']) ? $_POST['inputMessage'] : null;

    if ($email && $subject && $message && $name) {
        $to = ini_get('sendmail_from') ? ini_get('sendmail_from') : "admin@example.com";
        $headers = "From: $email";
        $sanitizedEmail = filter_var($email, FILTER_SANITIZE_EMAIL);
        if (strlen($sanitizedEmail) !== strlen($email)) {
            $errors[] = "Email appears suspicious.";
        }
        $mailLog = dirname(dirname(__DIR__)) . '/logs/mail.log';
        if (!file_exists($mailLog)) {
            touch($mailLog);
        }

        $send = mail($to, $subject, $message, $headers);

        if (!$send) {
            $errors[] = "Unable to send message.";
        }
    }

    if (isset($_FILES) && !empty($_FILES['filename'])) {
        $destination = dirname(dirname(__DIR__)) . '/uploads/';
        try {
            $upload = new FileUploader($destination);
            $upload->setMaxSize($max);
            $upload->allowAllTypes();
            $upload->setNotTrusted();
            $upload->upload();
            $results = $upload->getMessages();
        } catch (FolderException $e) {
            $errors[] = $e->getMessage();
        }
    }
    $fileError = error_get_last();
    if (!empty($fileError)) {
        $errors[] = $error['message'];
    }
}

$errorList = $userList = $resultList = '';
if (!empty($results)) {
    $resultsIterator = new RecursiveArrayIterator($results);
    foreach (new RecursiveIteratorIterator($resultsIterator) as $result) {
        $resultList .= "<div class='alert alert-success' role='alert'>
            $result</div>";
    }
}
if (!empty($errors)) {
    foreach ($errors as $error) {
        $errorList .= "<div class='alert alert-danger' role='alert'>
            <div>$error</div></div>";
    }
}

if (!empty($usersExist['users'])) {
    $usersIterator = new RecursiveArrayIterator($usersExist['users']);
    foreach (new RecursiveIteratorIterator($usersIterator) as $users) {
        $userList .= "<div class='alert alert-danger' role='alert'>
            $users is already taken.</div>";
    }
}
if (!empty($usersSearch) && empty($usersExist['users'])) {
    $userList = "<div class='alert alert-success' role='alert'>
            No users matching that username
    </div>";

}
$self = isset($_SERVER['PHP_SELF']) ? $_SERVER['PHP_SELF'] : null;

require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/customers/contactUsMain.php";
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . "partials/footer.php";
?>
<script type="text/javascript" src="<?=$jsPath;?>badContactDemo.js"></script>
<!--<script type="text/javascript" src="<?=$jsPath;?>customerCreate.js"></script>-->
</body>
</html>
