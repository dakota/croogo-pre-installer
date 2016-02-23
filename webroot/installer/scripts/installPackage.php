<?php
require "CroogoInstaller.php";

$package = $_GET['package'];
$version = $_GET['version'];

$allowedPackages = json_decode(dirname(__DIR__) . DIRECTORY_SEPARATOR . 'dependencies.json', true);

if (!isset($allowedPackages[$package])) {
    echo '0';
    exit;
}

$croogoInstaller = new CroogoInstaller();

$croogoInstaller->installPackage($package, $version);
