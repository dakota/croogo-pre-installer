<?php

require "CroogoInstaller.php";

$croogoInstaller = new CroogoInstaller();

$croogoInstaller->cleanup();
$output = $croogoInstaller->createProject();
$croogoInstaller->setMinimumStability();
$croogoInstaller->addCroogoRequire();

echo $output;
