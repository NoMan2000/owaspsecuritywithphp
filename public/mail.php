<?php

require_once 'partials/header.php';

use \Rhumsaa\Uuid\Uuid;
use \security\Models\Login\EmailConfirmAccount;

$uniqueID = Uuid::uuid4();
$email = "foo@example.com";
$emailAccount = new EmailConfirmAccount($email, $uniqueID);

//trigger_error("Testing if the Email Error Catcher Works", E_USER_ERROR);
