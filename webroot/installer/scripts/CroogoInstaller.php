<?php

/**
 * Class ComposerRunner
 */
class CroogoInstaller
{
    protected $composerDir;
    protected $tmpDir;
    protected $installDir;

    public function __construct()
    {
        $this->composerDir = sys_get_temp_dir() . DIRECTORY_SEPARATOR . 'composer';
        $this->tmpDir = sys_get_temp_dir() . DIRECTORY_SEPARATOR . 'croogo';
        $this->installDir = dirname(dirname(dirname(__DIR__)));
    }

    protected function delTree($dir)
    {
        $files = array_diff(scandir($dir), ['.', '..']);
        foreach ($files as $file) {
            (is_dir("$dir/$file")) ? $this->delTree("$dir/$file") : unlink("$dir/$file");
        }

        return rmdir($dir);
    }

    protected function recurseCopy($src, $dst)
    {
        $dir = opendir($src);
        @mkdir($dst);
        while (false !== ($file = readdir($dir))) {
            if (($file != '.') && ($file != '..')) {
                if (is_dir($src . '/' . $file)) {
                    $this->recurseCopy($src . '/' . $file, $dst . '/' . $file);
                } else {
                    copy($src . '/' . $file, $dst . '/' . $file);
                }
            }
        }
        closedir($dir);
    }

    public function requireComposer()
    {
        if (!file_exists($this->composerDir . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'autoload.php') ==
            true
        ) {
            $composer = new Phar('../composer.phar', 0);
            $composer->extractTo($this->composerDir);
        }

        require_once($this->composerDir . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'autoload.php');
        include "ComposerOutput.php";
    }

    public function createProject()
    {
        $this->requireComposer();

        $input = new \Symfony\Component\Console\Input\ArrayInput([
            'command' => 'create-project',
            '--stability' => 'dev',
            '--prefer-dist',
            '--no-interaction',
            'package' => 'cakephp/app',
            'directory' => $this->tmpDir,
        ]);
        $output = new ComposerOutput();

        $application = new \Composer\Console\Application();
        $application->setAutoExit(false);
        $application->run($input, $output);

        $this->recurseCopy($this->tmpDir, $this->installDir);
    }

    public function installCroogo()
    {
        $this->requireComposer();

        $requireInput = [
            'command' => 'require',
            '--prefer-dist',
            '--no-interaction',
            '--working-dir' => $this->installDir,
            'packages' => [
                'cakephp/acl:dev-master@dev',
                'cakedc/search:3.0.x@dev',
                'admad/cakephp-sequence:dev-master@dev',
                'croogo/croogo:3.0.x@dev'
            ],
        ];

        $input = new \Symfony\Component\Console\Input\ArrayInput($requireInput);
        $output = new ComposerOutput();

        $application = new \Composer\Console\Application();
        $application->setAutoExit(false);
        $application->run($input, $output);
    }

    public function cleanup()
    {
        if (is_dir($this->composerDir)) {
            $this->delTree($this->composerDir);
        }

        if (is_dir($this->tmpDir)) {
            $this->delTree($this->tmpDir);
        }
    }
}
