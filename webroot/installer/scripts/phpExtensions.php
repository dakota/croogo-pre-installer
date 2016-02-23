<?php
$result = [];

$extensions = get_loaded_extensions();
$required_extensions = ['mbstring', 'intl', 'curl'];
$one_of_extensions = ['pdo_mysql', 'pdo_pgsql', 'pdo_sqlite', 'pdo_sqlsrv'];

$missing_extensions = array_diff($required_extensions, $extensions);

if (!empty($missing_extensions)) {
    $result['ok'] = false;
    $result['text'] = 'Missing extensions ' . implode(', ', $missing_extensions);
} else {
    $has_one = false;
    foreach ($one_of_extensions as $extension) {
        if (in_array($extension, $extensions)) {
            $has_one = true;
            break;
        }
    }

    if ($has_one) {
        $result['ok'] = true;
    } else {
        $result['ok'] = false;
        $result['text'] = 'One of ' . implode(', ', $one_of_extensions) . ' must be installed';
    }
}

require('output.php');

output($result);
