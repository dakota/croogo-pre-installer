<?php
require "CroogoInstaller.php";

$croogoInstaller = new CroogoInstaller();

$output = $croogoInstaller->configureSite($_POST);

echo $output;
