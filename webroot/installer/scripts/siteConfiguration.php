<?php
require "CroogoInstaller.php";
require "output.php";

$croogoInstaller = new CroogoInstaller();

$croogoInstaller->configureSite($_POST);
$croogoInstaller->setAutoloadScript();
$croogoInstaller->dumpAutoloader();

output(['ok' => true]);
