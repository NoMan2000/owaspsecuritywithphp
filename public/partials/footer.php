<?php
require_once dirname(__DIR__) . '/init.php';

use \security\Models\Router\Router;

$router = new Router(__DIR__);
$jsPath = $router->rootPath . 'js/';
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
<footer class="footer">
    <div class="container">
      <p class="text-muted">All content copyright Widget Corp. &copy;</p>
      <p><a href="mailto:" class='emailLink'
        data-company='widgetCorp'
        data-name='webmaster'
        data-extension='.com'
        >Email Widget Corp.</a>
        </p>
    </div>
</footer>
<script src="<?=$jsPath;?>CookieFunctions.js"></script>
<script src="<?=$jsPath;?>scripts.min.js"></script>
</div>
