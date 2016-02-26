<?php
require "CroogoInstaller.php";
require "output.php";

$croogoInstaller = new CroogoInstaller();

$croogoInstaller->moveFiles();

output(['ok' => true]);
