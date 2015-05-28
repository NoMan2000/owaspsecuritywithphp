<?php

namespace security\Traits;

trait SessionState
{
    public function sessionHasStarted()
    {
        if (version_compare(PHP_VERSION, '5.4.0', '>=')) {
            if (session_status() == PHP_SESSION_NONE) {
                return false;
            } elseif (session_status() === PHP_SESSION_ACTIVE) {
                return true;
            }
        } elseif (session_id() == '') {
            return false;
        }
        return true;
    }
}
