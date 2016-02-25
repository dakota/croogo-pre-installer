<?php
ini_set('memory_limit', -1);

require "CroogoInstaller.php";

$croogoInstaller = new CroogoInstaller();

$dependencies = $croogoInstaller->getDependencyList();

require('output.php');

output($dependencies);
