<?php
require "CroogoInstaller.php";
require "output.php";

$croogoInstaller = new CroogoInstaller();

$croogoInstaller->databaseInstall($_POST);

output(['ok' => true]);
