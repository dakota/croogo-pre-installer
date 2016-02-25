<?php

/**
 * Class ComposerRunner
 */
class CroogoInstaller
{
    CONST CROOGOVERSION = '3.0.x-dev';

    protected $composerDir;
    protected $tmpDir;
    protected $installDir;

    public function __construct()
    {
        $this->installDir = dirname(dirname(dirname(__DIR__))) . DIRECTORY_SEPARATOR . 'croogo';
        $this->composerDir = $this->installDir . DIRECTORY_SEPARATOR . 'composer';
        $this->tmpDir = $this->installDir . DIRECTORY_SEPARATOR . 'croogo';
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

    protected function requireComposer()
    {
        if (!file_exists($this->composerDir . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'autoload.php') ==
            true
        ) {
            $composer = new Phar('../composer.phar', 0);
            $composer->extractTo($this->composerDir);
        }

        require_once($this->composerDir . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'autoload.php');
    }

    protected function runComposer($input)
    {
        $this->requireComposer();

        $input = new \Symfony\Component\Console\Input\ArrayInput($input);
        $output = new \Symfony\Component\Console\Output\BufferedOutput();

        $application = new \Composer\Console\Application();
        $application->setAutoExit(false);
        $application->run($input, $output);

        return $output;
    }

    public function createProject()
    {
        if (is_file($this->installDir . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . 'Controller' . DIRECTORY_SEPARATOR . 'AppController.php') && is_file($this->installDir)) {
            return 'already installed';
        }

        $output = $this->runComposer([
            'command' => 'create-project',
            '--stability' => 'dev',
            '--prefer-dist' => true,
            '--no-interaction' => true,
            '--no-install' => true,
            'package' => 'cakephp/app',
            'directory' => $this->tmpDir,
        ]);

        if (is_file($this->installDir . DIRECTORY_SEPARATOR . 'composer.lock')) {
            unlink($this->installDir . DIRECTORY_SEPARATOR . 'composer.lock');
        }

        return $output->fetch();
    }

    protected function openComposerJson()
    {
        $composerFile = $this->installDir . DIRECTORY_SEPARATOR . 'composer.json';
        return json_decode(file_get_contents($composerFile), true);
    }

    protected function saveComposerJson($json)
    {
        $composerFile = $this->installDir . DIRECTORY_SEPARATOR . 'composer.json';
        file_put_contents($composerFile, json_encode($json, JSON_PRETTY_PRINT));
    }

    public function setMinimumStability()
    {
        $json = $this->openComposerJson();
        $json['minimum-stability'] = 'dev';
        $this->saveComposerJson($json);
    }

    public function addCroogoRequire()
    {
        $json = $this->openComposerJson();
        $json['require']['croogo/croogo'] = self::CROOGOVERSION;
        $this->saveComposerJson($json);
    }

    public function setAutoloadScript()
    {
        $json = $this->openComposerJson();
        $json['post-autoload-dump'] = [
            'Cake\\Composer\\Installer\\PluginInstaller::postAutoloadDump',
            'Croogo\\Install\\ComposerInstaller::postAutoloadDump'
        ];
        $this->saveComposerJson($json);
    }

    public function clearDependencies()
    {
        $json = $this->openComposerJson();
        unset($json['require']);
        $this->saveComposerJson($json);
    }

    public function setDependencies($dependencies)
    {
        $json = $this->openComposerJson();
        $json['require'] = $dependencies;
        $this->saveComposerJson($json);
    }

    public function getDependencyList()
    {
        $this->requireComposer();

        $output = $this->runComposer([
            'command' => 'install',
            '--working-dir' => $this->tmpDir,
            '--dry-run' => true,
            '--no-dev' => true,
            '--no-interaction' => true,
        ]);

        $messages = explode("\n", $output->fetch());
        $dependencies = [];
        foreach ($messages as $message) {
            if (preg_match_all('/Installing (.*\/.*) \((.*)/', $message, $matches) == 0) {
                continue;
            }
            $version = explode(' ', $matches[2][0]);
            $dependencies[$matches[1][0]] = $version[0];
        }

        $this->clearDependencies();

        return $dependencies;
    }

    public function installPackage($package, $version)
    {
        $this->requireComposer();

        $output = $this->runComposer([
            'command' => 'require',
            '--prefer-dist' => true,
            '--no-interaction' => true,
            '--working-dir' => $this->tmpDir,
            '--no-progress' => true,
            'packages' => [
                $package . ($version ? ':' . $version : '')
            ],
        ]);

        return $output->fetch();
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
