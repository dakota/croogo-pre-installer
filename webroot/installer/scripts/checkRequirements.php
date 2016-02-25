<?php

function is_empty($directory)
{
    return (count(scandir($directory)) == 3);//3 items, one for '.', one for '..' and one for the 'empty' file
}

function version($minimum)
{
    $version = phpversion();
    return version_compare($version, $minimum, 'ge');
}

function checkRequiredExtensions()
{
    $extensions = get_loaded_extensions();
    $required_extensions = ['mbstring', 'intl', 'curl'];

    $missing_extensions = array_diff($required_extensions, $extensions);

    return !empty($missing_extensions) ? $missing_extensions : true;
}

function databaseExtensions()
{
    $extensions = get_loaded_extensions();

    $one_of_extensions = ['pdo_mysql', 'pdo_pgsql', 'pdo_sqlite', 'pdo_sqlsrv'];

    $has_one = false;
    foreach ($one_of_extensions as $extension) {
        if (in_array($extension, $extensions)) {
            $has_one = true;
            break;
        }
    }

    if ($has_one) {
        return true;
    } else {
        return $one_of_extensions;
    }
}
