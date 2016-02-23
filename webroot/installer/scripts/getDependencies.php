<?php
ini_set('memory_limit', -1);

require "CroogoInstaller.php";

$croogoInstaller = new CroogoInstaller();

$dependencyFile = dirname(__DIR__) . DIRECTORY_SEPARATOR . 'dependencies.json';
$dependencies = $croogoInstaller->getDependencyList();
file_put_contents($dependencyFile, json_encode($dependencies));

require('output.php');

output($dependencies);
