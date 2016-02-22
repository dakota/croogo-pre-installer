<?php
require "CroogoInstaller.php";

$croogoInstaller = new CroogoInstaller();

$croogoInstaller->installCroogo();
$croogoInstaller->cleanup();
