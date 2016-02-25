<?php

function is_empty($directory)
{
    return (count(scandir($directory)) <= 3);//3 items, one for '.', one for '..' and one for the 'empty' file
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

function availableDrivers()
{
    $drivers = PDO::getAvailableDrivers();

    $supported = ['mysql', 'pgsql', 'sqlite', 'sqlsrv'];

    return array_intersect($supported, $drivers);
}
