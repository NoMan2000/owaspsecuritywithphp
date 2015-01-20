<?php 

require_once('partials/header.php');

use \security\Models\Login\EmailConfirmAccount;
use \Rhumsaa\Uuid\Uuid;
use \Rhumsaa\Uuid\Exception\UnsatisfiedDependencyException;
use \security\Models\SiteLogger\FullLog;

// $uniqueID = Uuid::uuid4();
// $email = "foo@example.com";
// $emailAccount = new EmailConfirmAccount($email, $uniqueID);

trigger_error("Testing if the Email Error Catcher Works", E_USER_ERROR);

// if (getenv('WEB_ENVIRONMENT') === 'dev') {
//     $log->addInfo("Testing info Levels.");
// }