<?php

//require_once(dirname(__DIR__) . DIRECTORY_SEPARATOR . 'vendor/autoload.php');

require_once('partials/header.php');

class mailCatcher {
    private $mailcatcher;

    public function __construct()
    {
        $this->mailcatcher = new \Guzzle\Http\Client('http://127.0.0.1:1080');
    }

    // api calls
    public function cleanMessages()
    {
        $this->mailcatcher->delete('/messages')->send();
    }

    public function getLastMessage()
    {
        $messages = $this->getMessages();
        if (empty($messages)) {
            $this->fail("No messages received");
        }
        // messages are in descending order
        return reset($messages);
    }
    public function fail($failMessage)
    {
        return $failMessage;
    }

    public function getMessages()
    {
        $jsonResponse = $this->mailcatcher->get('/messages')->send();
        return json_decode($jsonResponse->getBody());
    }
    public function getJSONONLY()
    {
        $jsonResponse = $this->mailcatcher->get('/messages')->send();
    }
    public function getHTMLMessage($id)
    {
        try {
        $jsonResponse = $this->mailcatcher->get("/messages/{$id}.source")->send();
        return $jsonResponse->getBody();
        } catch (Exception $e) {
            return "No message for id: $id";
        }
    }
}
$messages = [];
try {
    $mailcatcher = new Mailcatcher();
    $mailcatcher->getJSONONLY();
    $messages = $mailcatcher->getMessages();
} catch (Exception $e) {
    $notFound = true;  
}
if (!isset($notFound) && !empty($messages)) {
    echo "<pre>";
     foreach ($messages as $message){
        $body = $mailcatcher->getHTMLMessage($message->id);
        echo $body;
    }
    echo "</pre>"; 
}
$mail = file_get_contents('/var/mail/ubuntu');
?>
<div style='width:90%;margin:0 auto;margin-top:-21px;'>
    <code><pre>
        <?= $mail;?>
    </pre></code>
</div>


<?php
require_once('partials/footer.php');
