<?php

function delTree($dir)
{
    $files = array_diff(scandir($dir), ['.', '..']);
    foreach ($files as $file) {
        (is_dir("$dir/$file")) ? delTree("$dir/$file") : unlink("$dir/$file");
    }

    return rmdir($dir);
}

define('COMPOSER_DIR', sys_get_temp_dir() . DIRECTORY_SEPARATOR . 'composer');
define('PROJECT_DIR', sys_get_temp_dir() . DIRECTORY_SEPARATOR . 'croogo');

if (!file_exists(COMPOSER_DIR . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'autoload.php') == true) {
    $composer = new Phar('../composer.phar', 0);
    $composer->extractTo(COMPOSER_DIR);
}

//This requires the phar to have been extracted successfully.
require_once(COMPOSER_DIR . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'autoload.php');

include "ComposerFormatter.php";
include "ComposerInput.php";
include "ComposerOutput.php";

$input = new \Symfony\Component\Console\Input\ArrayInput([
    'command' => 'create-project',
    '--stability' => 'dev',
    '--prefer-dist',
    '--no-interaction',
    'package' => 'cakephp/app',
    'directory' => PROJECT_DIR,
]);
$output = new ComposerOutput();

$application = new \Composer\Console\Application();
$application->setAutoExit(false);
$application->run($input, $output);

$input = new \Symfony\Component\Console\Input\ArrayInput([
    'command' => 'require',
    '--stability' => 'dev',
    '--prefer-dist',
    '--no-interaction',
    '--working-dir' => PROJECT_DIR,
    'packages' => 'croogo/croogo 3.0.*@dev',
]);
$application->run($input, $output);

delTree(COMPOSER_DIR);

