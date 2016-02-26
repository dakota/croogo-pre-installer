<?php
require "CroogoInstaller.php";
require "output.php";

$croogoInstaller = new CroogoInstaller();

$croogoInstaller->databaseInstall();

output(['ok' => true]);
