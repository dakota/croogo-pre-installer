<?php
require "CroogoInstaller.php";

$croogoInstaller = new CroogoInstaller();

$croogoInstaller->configureSite($_POST);
$croogoInstaller->setAutoloadScript();
$croogoInstaller->dumpAutoloader();
