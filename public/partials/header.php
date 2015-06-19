<?php
require_once dirname(__DIR__) . '/init.php';

use \security\Models\Router\HttpsCheck;
use \security\Models\Router\Router;

$router = new Router(__DIR__);
$cssPath = $router->rootPath . 'css/';
$icoPath = $router->rootPath . 'images/favicon/';
$check = new HttpsCheck();

if (!$check->isServerSecure()) {
    die("<h1>Warning:  This website does not work if not on a secure https Server.</h1>");
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" sizes="57x57" href="<?=$icoPath;?>apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="<?=$icoPath;?>apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<?=$icoPath;?>apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<?=$icoPath;?>apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<?=$icoPath;?>apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="<?=$icoPath;?>apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="<?=$icoPath;?>apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="<?=$icoPath;?>apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="<?=$icoPath;?>apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="<?=$icoPath;?>android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="<?=$icoPath;?>favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="<?=$icoPath;?>favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="<?=$icoPath;?>favicon-16x16.png">
    <link rel="manifest" href="<?=$icoPath;?>manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="<?=$icoPath;?>ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <title>PHP Secure Authentication</title>

    <!-- Bootstrap -->
    <link href="<?=$cssPath;?>catcss.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <div class='wrapper clearfix' id='wrapper'>
