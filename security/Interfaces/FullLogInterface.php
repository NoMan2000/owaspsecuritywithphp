<?php

namespace security\Interfaces;

require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR. 'vendor/autoload.php');

interface FullLogInterface
{
    public function setLogger(FullLogInterface $logger);
    public function getLogger();
    public function setDefaultLogger();
    public function serverData();
    public function addDebug($data);
    public function addInfo($data);
    public function addNotice($data);
    public function addWarning($data);
    public function addError($data);
    public function addCritical($data);
    public function addAlert($data);
    public function addEmergency($data);
}
