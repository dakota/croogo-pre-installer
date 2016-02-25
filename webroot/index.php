<?php
if (php_sapi_name() === 'cli-server') {
    $_SERVER['PHP_SELF'] = '/' . basename(__FILE__);

    $url = parse_url(urldecode($_SERVER['REQUEST_URI']));
    $file = __DIR__ . $url['path'];
    if (strpos($url['path'], '..') === false && strpos($url['path'], '.') !== false && is_file($file)) {
        return false;
    }
}

$url = parse_url(urldecode($_SERVER['REQUEST_URI']));

switch ($url['path']) {
    case '/':
        header('Location: /install');
        break;
    case '/install':
        require 'installer/installer.php';
        break;
    default:
        header('Location: /installer' . $url['path']);
}
