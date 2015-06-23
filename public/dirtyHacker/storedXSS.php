<?php
header('X-XSS-Protection: 0');
require_once 'SQLite.php';

$query = "CREATE TABLE IF NOT EXISTS `comments` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `comment` TEXT
)";

$sqlite->exec($query);

if (isset($_POST['submit'])) {
    echo "Thanks for your comment.<br/>";
    // $comment = $sqlite->quote($_POST['injectionOne']);
    $comment = SQLite3::escapeString($_POST['injectionOne']);
    echo $comment;

    $query = "INSERT INTO comments (comment) VALUES('$comment')";
    $affected = $sqlite->exec($query);
    $error = $sqlite->errorInfo();
    if (!$affected || !empty($error[2])) {
        echo $error[2] . "<br/>";
        echo "Something went wrong with this query.";
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Dirty Hacker Stored XSS</title>
</head>
<body>
<form action="#" method="POST" id='dirtyForm' name='dirtyForm'>
<label>Add comment</label>
    <textarea name='injectionOne' id='injectionOne'></textarea>
    <input type='submit' name='submit' id='submit'>
</form>
<div id='dirtyHTML'>
<?php
$query = "SELECT comment FROM comments";
foreach ($sqlite->query($query) as $row) {
    $safeContent = htmlentities($row['comment']);
    echo "<div class='comment'>{$safeContent}</div>";
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

