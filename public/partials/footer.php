<?php 
require_once(dirname(__DIR__) . '/init.php');

use \security\Models\Router\Router;

$router = new Router(__DIR__);
$jsPath = $router->rootPath . 'public/js/';
?>
<div id="ajaxContentHolder">
  <div id='centerSpinner'>
        <div id="spinnerText">
            <p>
               We are processing your request, please be patient. 
            </p>
        </div>
    </div>
  </div>
    <script src="<?=$jsPath;?>CookieFunctions.js"></script>
    <script src="<?=$jsPath;?>scripts.min.js"></script>
