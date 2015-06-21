<?php

require_once "../../partials/header.php";

use \GuzzleHttp\Client;

$ipsumGenerator = new Client(['base_uri' => 'http://www.schmipsum.com']);
$shakespeare = $ipsumGenerator->get('/ipsum/shakespeare/40');
$shakespeare = json_decode($shakespeare->getBody());

$userName = isset($_POST['inputUserName']) ? $_POST['inputUserName'] : null;
$password = isset($_POST['password']) ? $_POST['password'] : null;
$errors = isset($_GET['errors']) ? htmlentities($_GET['errors']) : null;
$errorList = '';
if ($errors) {
    $errorList .= "<div id='errorHolder' class='alert alert-danger' role='alert'>
            <div id='errorContent'>$errors</div>
            </div>";
}

require_once "../../partials/corporate/corporateloginMain.php";
require_once "../../partials/footer.php";
?>

<script type="text/javascript" src="<?=$jsPath;?>corporatelogin.js"></script>
</body>
</html>
