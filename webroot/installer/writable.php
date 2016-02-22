<?php
$result = [];
$dir = dirname(dirname(dirname(__FILE__)));
$result['ok'] = is_writable($dir);

if (!$result['ok']) {
    $result['text'] = 'Is not writable';
}
require('output.php');
