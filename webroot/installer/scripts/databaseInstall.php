<?php
require "CroogoInstaller.php";

$croogoInstaller = new CroogoInstaller();

$output = $croogoInstaller->databaseInstall();

echo $output;
