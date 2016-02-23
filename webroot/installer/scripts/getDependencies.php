<?php

require "CroogoInstaller.php";

$croogoInstaller = new CroogoInstaller();

$dependencies = $croogoInstaller->getDependencyList();

require('output.php');

output($dependencies);
