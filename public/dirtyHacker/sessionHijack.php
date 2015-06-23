<?php

session_start();

if (isset($_GET['submit'])) {
    extract($_GET);
    if ($password === 'password') {
        $_SESSION['isAuthenticated'] = true;
        $_SESSION['password'] = $password;
        $_SESSION['username'] = $username;
    }
}
if (isset($_SESSION['isAuthenticated'])) {
    header('Location: loggedin.php');
}

?>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<form id='login' name='login' method='GET'>
    <div>
        <label for='username'>UserName:</label>
        <input type='text' name='username' id='username'/>
    </div>
    <div>
        <label for='password'>Password:</label>
        <input type='password' name='password' id='password'/>
    </div>
    <div>
        <input type='submit' value='submit' name='submit' id='submit' />
    </div>
</form>
</body>
</html>
