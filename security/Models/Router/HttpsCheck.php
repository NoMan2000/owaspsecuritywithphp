<?php

namespace security\Models\Router;

require_once dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . "public/init.php";

use \security\Traits\AbsolutePaths;

class HttpsCheck
{
    use AbsolutePaths;
}
