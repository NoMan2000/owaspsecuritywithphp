<?php

namespace security\Traits;

trait IsDevelopment
{
    protected function isDev()
    {
        if (getenv('WEB_ENVIRONMENT') === 'dev') {
            return true;
        }
        return false;
    }
}
