<?php
// By default, most browsers enable xss protection, this explicitly
// disables it.
header('X-XSS-Protection: 1');
?>
<!DOCTYPE html>
<html>
<head>
    <title>Dirty Hacker</title>
</head>
<body>
<form action="#" method="GET" id='dirtyForm' name='dirtyForm'>
<label>Mixed Content</label>
    <input type='text' name='injectionOne' id='injectionOne' />
    <input type='submit' name='submit'>
</form>
<div id='dirtyHTML'>
<?php
if (isset($_GET['submit'])) {
    echo $_GET['injectionOne'];
}
if (isset($_GET['submit'])) {
    echo htmlentities($_GET['injectionOne']);
}
?>
</div>

<blockquote>
    <code>
        &#x3C;div onclick=&#x27;window.alert(&#x22;Got you!&#x22;);&#x27;&#x3E;The Dirty Hacker Strikes&#x3C;/div&#x3E;
    </code>
</blockquote>

</body>
</html>
