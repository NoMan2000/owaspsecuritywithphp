<?php

require_once 'partials/header.php';

use \security\Models\Mailcatcher;

$messages = [];
$validMail = true;
try {
    $mailcatcher = new Mailcatcher();
    $mailcatcher->getJSONONLY();
    $messages = $mailcatcher->getMessages();
} catch (Exception $e) {
    $validMail = false;
}
if ($validMail && !empty($messages)) {
    echo "<pre>";
    foreach ($messages as $message) {
        $body = $mailcatcher->getHTMLMessage($message->id);
        echo $body;
    }
    echo "</pre>";
}
$mail = file_get_contents('/var/mail/ubuntu');
$mail = htmlentities($mail);
?>
<div style='width:90%;margin:0 auto;'>
    <pre>
        <?=$mail;?>
    </pre>
</div>


<?php
// require_once('partials/footer.php');
