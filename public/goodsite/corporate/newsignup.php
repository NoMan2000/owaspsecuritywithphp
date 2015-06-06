<?php

$userName = isset($_POST['inputUserName']) ? strip_tags($_POST['inputUserName']) : null;
$errors = isset($_GET['errors']) ? htmlentities($_GET['errors']) : null;
$errorList = '';
if ($errors) {
    $errorList .= "<div id='errorHolder' class='alert alert-danger'
    role='alert'>
    <div id='errorContent'>{$errors}</div></div>";
}

?>

<input>


<?php
require_once "../../partials/corporate/signupFormPartial.php";
require_once "../../partials/footer.php";
?>

<script type="text/javascript" src="../../js/index.js"></script>
</body>
</html>
