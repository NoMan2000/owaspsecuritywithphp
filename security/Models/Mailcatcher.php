<?php

namespace security\Models;

require_once dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'public/init.php';

use \GuzzleHttp\Client;

class MailCatcher
{
    private $mailcatcher;

    public function __construct()
    {
        $this->mailcatcher = new Client('http://127.0.0.1:1080');
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
