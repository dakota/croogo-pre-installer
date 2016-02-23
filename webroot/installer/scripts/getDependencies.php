<?php
ini_set('memory_limit', -1);

require "CroogoInstaller.php";

$croogoInstaller = new CroogoInstaller();

$dependencies = $croogoInstaller->getDependencyList();

file_put_contents(dirname(__DIR__) . DIRECTORY_SEPARATOR . 'dependencies.json', json_encode($dependencies));

require('output.php');

output($dependencies);
