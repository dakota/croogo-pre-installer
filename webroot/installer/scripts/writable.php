<?php
$result = [];
$dir = is_writable(dirname(dirname(dirname(__FILE__))));
$tmp = is_writable(sys_get_temp_dir());
$result['ok'] = $dir && $tmp;

if (!$result['ok']) {
    $result['text'] = 'Is not writable';
}
require('output.php');

output($result);
