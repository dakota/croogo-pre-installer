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
        $output = $this->runComposer([
            'command' => 'create-project',
            '--stability' => 'dev',
            '--prefer-dist' => true,
            '--no-interaction' => true,
            '--no-install' => true,
            'package' => 'cakephp/app',
            'directory' => $this->tmpDir,
        ]);

        $this->recurseCopy($this->tmpDir, $this->installDir);

        if (is_file($this->installDir . DIRECTORY_SEPARATOR . 'composer.lock')) {
            unlink($this->installDir . DIRECTORY_SEPARATOR . 'composer.lock');
        }

        return $output->fetch();
    }

    public function setMinimumStability()
    {
        $composerFile = $this->installDir . DIRECTORY_SEPARATOR . 'composer.json';
        $json = json_decode(file_get_contents($composerFile), true);
        $json['minimum-stability'] = 'dev';
        file_put_contents($composerFile, json_encode($json, JSON_PRETTY_PRINT));
    }

    public function addCroogoRequire()
    {
        $composerFile = $this->installDir . DIRECTORY_SEPARATOR . 'composer.json';
        $json = json_decode(file_get_contents($composerFile), true);
        $json['require']['croogo/croogo'] = self::CROOGOVERSION;
        file_put_contents($composerFile, json_encode($json, JSON_PRETTY_PRINT));
    }

    public function setAutoloadScript()
    {
        $composerFile = $this->installDir . DIRECTORY_SEPARATOR . 'composer.json';
        $json = json_decode(file_get_contents($composerFile), true);
        $json['post-autoload-dump'] = [
            'Cake\\Composer\\Installer\\PluginInstaller::postAutoloadDump',
            'Croogo\\Install\\ComposerInstaller::postAutoloadDump'
        ];
        file_put_contents($composerFile, json_encode($json, JSON_PRETTY_PRINT));
    }

    public function getDependencyList()
    {
        $this->requireComposer();

        $output = $this->runComposer([
            'command' => 'install',
            '--working-dir' => $this->installDir,
            '--dry-run' => true,
            '--no-dev' => true,
            '--no-interaction' => true,
        ]);

        $messages = explode("\n", $output->fetch());
        $dependencies = [];
        foreach ($messages as $message) {
            if (preg_match_all('/Installing (.*\/.*) \((.*)\)/', $message, $matches) == 0) {
                continue;
            }
            $dependencies[$matches[1][0]] = $matches[2][0];
        }

        return $dependencies;
    }

    public function installPackage($package, $version)
    {
        $this->requireComposer();

        $output = $this->runComposer([
            'command' => 'require',
            '--prefer-dist' => true,
            '--no-interaction' => true,
            '--working-dir' => $this->installDir,
            '--no-update' => true,
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
