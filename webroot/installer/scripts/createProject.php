<?php

require "CroogoInstaller.php";
require "output.php";

$croogoInstaller = new CroogoInstaller();

$croogoInstaller->cleanup();
$output = $croogoInstaller->createProject();
$croogoInstaller->setMinimumStability();
$croogoInstaller->addCroogoRequire();

output(['response' => $output]);
