<?php
ini_set('memory_limit', -1);

require "CroogoInstaller.php";
require 'output.php';

$croogoInstaller = new CroogoInstaller();

$dependencies = $croogoInstaller->getDependencyList();

output($dependencies);
