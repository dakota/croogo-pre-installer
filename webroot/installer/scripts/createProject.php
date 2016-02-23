<?php

require "CroogoInstaller.php";

$croogoInstaller = new CroogoInstaller();

$croogoInstaller->cleanup();
$croogoInstaller->createProject();
$croogoInstaller->setMinimumStability();
$croogoInstaller->addCroogoRequire();

