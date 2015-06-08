<?php

require_once "../../partials/header.php";

use \Guzzle\Http\Client;

$ipsumGenerator = new Client('http://www.schmipsum.com');
$shakespeare = $ipsumGenerator->get('/ipsum/shakespeare/40')->send();
$shakespeare = json_decode($shakespeare->getBody());

$userName = isset($_POST['inputUserName']) ? $_POST['inputUserName'] : null;
$password = isset($_POST['password']) ? $_POST['password'] : null;
$errors = isset($_GET['errors']) ? htmlentities($_GET['errors']) : null;
$errorList = '';
if ($errors) {
    $errorList .= "<div id='errorHolder' class='alert alert-danger'
                   role='alert'>
                   <div id='errorContent'>$errors</div></div>";
}
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'partials/corporate/badcorporateloginMain.php';
require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'partials/footer.php';
?>
<input type='hidden' id='redirectPath' name='redirectPath' value='badsite/corporate/viewCorporate.php?id='>
<script type="text/javascript" src="<?=$jsPath;?>badcorporatelogin.js"></script>
</body>
</html>
