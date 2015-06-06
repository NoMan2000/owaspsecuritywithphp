<?php

require_once "../partials/header.php";

// Very bad.
// Never accept raw user input.
$userName = !empty($_POST['inputUserName']) ? $_POST['inputUserName'] : null;
$password = !empty($_POST['password']) ? $_POST['password'] : null;
$errors = [];
if (isset($_GET['errors'])) {
    $errors[] = $_GET['errors'];
}

$userName = isset($_POST['inputUserName']) ? strip_tags($_POST['inputUserName']) : null;
$errors = isset($_GET['errors']) ? htmlentities($_GET['errors']) : null;
$errorList = '';
if ($errors) {
    $errorList .= "<div id='errorHolder' class='alert alert-danger'
    role='alert'>
    <div id='errorContent'>{$errors}</div></div>";
}
?>

<?php
require_once "../partials/indexFormPartial.php";
require_once "../partials/footer.php";
?>

<script type="text/javascript" src="js/badIndex.js"></script>
</body>
</html>
