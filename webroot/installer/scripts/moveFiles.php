<?php
require "CroogoInstaller.php";

$croogoInstaller = new CroogoInstaller();

$output = $croogoInstaller->moveFiles();

echo $output;
