<?php
ini_set('memory_limit', -1);

require "CroogoInstaller.php";
require 'output.php';

$package = $_GET['package'];
$version = $_GET['version'];

$croogoInstaller = new CroogoInstaller();

$output = $croogoInstaller->installPackage($package, $version);

output(['response' => $output]);
