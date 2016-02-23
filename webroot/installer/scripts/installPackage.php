<?php
require "CroogoInstaller.php";

$croogoInstaller = new CroogoInstaller();

$croogoInstaller->installPackage($_GET['package']);
