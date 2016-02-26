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
    protected $databaseDrivers = [
        'mysql' => 'Cake\Database\Driver\Mysql',
        'postgres' => 'Cake\Database\Driver\Postgres',
        'sqlite' => 'Cake\Database\Driver\Sqlite',
        'sqlsrv' => 'Cake\Database\Driver\Sqlserver',
        'sqlserver' => 'Cake\Database\Driver\Sqlserver',
    ];

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

    /**
     * Update the applications bootstrap.php file.
     *
     * @param string $plugin Name of plugin.
     * @param bool $hasBootstrap Whether or not bootstrap should be loaded.
     * @param bool $hasRoutes Whether or not routes should be loaded.
     * @param bool $hasAutoloader Whether or not there is an autoloader configured for
     * the plugin.
     * @return bool If modify passed.
     */
    protected function loadPlugin($plugin, $hasBootstrap, $hasRoutes, $hasAutoloader)
    {
        $bootstrapFileName = $this->tmpDir . DIRECTORY_SEPARATOR . 'config' . DIRECTORY_SEPARATOR . 'bootstrap.php';;
        $bootstrap = new \Cake\Filesystem\File($bootstrapFileName, false);
        $contents = $bootstrap->read();
        if (!preg_match("@\n\s*Plugin::loadAll@", $contents)) {
            $autoloadString = $hasAutoloader ? "'autoload' => true" : '';
            $bootstrapString = $hasBootstrap ? "'bootstrap' => true" : '';
            $routesString = $hasRoutes ? "'routes' => true" : '';

            $append = "\nPlugin::load('%s', [%s]);\n";
            $options = implode(', ', array_filter([$autoloadString, $bootstrapString, $routesString]));

            $bootstrap->append(str_replace(', []', '', sprintf($append, $plugin, $options)));

            return true;
        }

        return false;
    }

    public function createProject()
    {
        if (is_file($this->tmpDir . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . 'Controller' . DIRECTORY_SEPARATOR . 'AppController.php') && is_file($this->installDir)) {
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

        if (is_file($this->tmpDir . DIRECTORY_SEPARATOR . 'composer.lock')) {
            unlink($this->tmpDir . DIRECTORY_SEPARATOR . 'composer.lock');
        }

        return $output->fetch();
    }

    protected function openComposerJson()
    {
        $composerFile = $this->tmpDir . DIRECTORY_SEPARATOR . 'composer.json';
        return json_decode(file_get_contents($composerFile), true);
    }

    protected function saveComposerJson($json)
    {
        $composerFile = $this->tmpDir . DIRECTORY_SEPARATOR . 'composer.json';
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
        $json['scripts']['post-autoload-dump'] = [
            'Cake\\Composer\\Installer\\PluginInstaller::postAutoloadDump',
            'Croogo\\Install\\ComposerInstaller::postAutoloadDump'
        ];
        $this->saveComposerJson($json);
    }

    public function clearDependencies()
    {
        $json = $this->openComposerJson();
        unset($json['require']);
        unset($json['require-dev']);
        unset($json['scripts']);
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
            if (preg_match_all('/Installing (.*\/.*) \((.*)\)/', $message, $matches) == 0) {
                continue;
            }
            $version = explode(' ', $matches[2][0]);
            $dependencies[] = [
                'package' => $matches[1][0],
                'version' => $version[0]
            ];
        }

        $this->clearDependencies();

        $dependencyFile = $this->installDir . DIRECTORY_SEPARATOR . 'dependencies.json';

        file_put_contents($dependencyFile, json_encode($dependencies));

        return $dependencies;
    }

    public function installPackage($package, $version)
    {
        $allowedPackages = json_decode(file_get_contents($this->installDir . DIRECTORY_SEPARATOR . 'dependencies.json'), true);

        $allowed = false;
        foreach ($allowedPackages as $allowedPackage) {
            if ($allowedPackage['package'] === $package) {
                $allowed = true;
                break;
            }
        }
        if (!$allowed) {
            return false;
        }

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

    public function dumpAutoloader()
    {
        return $this->runComposer([
            'command' => 'dumpautoload',
            '--working-dir' => $this->tmpDir,
        ]);
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

    public function configureSite($data)
    {
        $siteConfiguration = json_decode(file_get_contents(dirname(__DIR__) . DIRECTORY_SEPARATOR . 'settings.json'), true);

        $siteConfiguration['Site']['name'] = $data['site-name'];
        $siteConfiguration['Site']['email'] = $data['site-email'];
        $siteConfiguration['Site']['tagline'] = $data['site-tagline'];
        $siteConfiguration['Meta']['description'] = $data['site-description'];
        $siteConfiguration['Meta']['keywords'] = $data['site-keywords'];
        $siteConfiguration['Admin']['username'] = $data['admin-username'];
        $siteConfiguration['Admin']['password'] = $data['admin-password'];

        $configDir = $this->tmpDir . DIRECTORY_SEPARATOR . 'config' . DIRECTORY_SEPARATOR;
        file_put_contents($configDir . 'settings.json', json_encode($siteConfiguration, JSON_PRETTY_PRINT));

        $this->runAppInstall();

        $replacements = [
            '__DBDRIVER__' => $this->databaseDrivers[$data['database-datasource']],
            '__DBHOST__' => $data['database-host'],
            '__DBPORT__' => $data['database-port'],
            '__DBUSER__' => $data['database-username'],
            '__DBPASSWORD__' => $data['database-password'],
            '__DBNAME__' => $data['database-database'],
        ];

        if (!file_exists($configDir . 'app.php')) {
            copy(dirname(__DIR__) . DIRECTORY_SEPARATOR . 'app.default.php', $configDir . 'app.php');
        }

        $config = $configDir . 'app.php';
        $content = file_get_contents($config);

        $content = str_replace(array_keys($replacements), array_values($replacements), $content);

        file_put_contents($config, $content);

        $route = $configDir . 'routes.php';
        $content = file_get_contents($route);

        $defaultRoute = '$routes->connect(\'/\', [\'controller\' => \'Pages\', \'action\' => \'display\', \'home\']);';
        $content = str_replace($defaultRoute, '//' . $defaultRoute, $content);

        file_put_contents($route, $content);
    }

    public function databaseInstall($data)
    {
        require $this->tmpDir . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'autoload.php';

        $configDir = $this->tmpDir . DIRECTORY_SEPARATOR . 'config' . DIRECTORY_SEPARATOR;

        $schema = explode(';', file_get_contents(dirname(__DIR__) . DIRECTORY_SEPARATOR . 'schema.sql'));
        $siteConfiguration = json_decode(file_get_contents($configDir . 'settings.json'), true);

        $replacements = [
            '{{admin-username}}' => $siteConfiguration['Admin']['username'],
            '{{admin-password}}' => (new \Cake\Auth\DefaultPasswordHasher())->hash($siteConfiguration['Admin']['password']),
            '{{site-email}}' => $siteConfiguration['Site']['email'],
            '{{date}}' => date('Y-m-d H:i:s'),
        ];

        unset($siteConfiguration['Admin']);
        file_put_contents($configDir . 'settings.json', json_encode($siteConfiguration, JSON_PRETTY_PRINT));

        \Cake\Core\Configure::config('default', new \Cake\Core\Configure\Engine\PhpConfig($configDir));

        \Cake\Core\Configure::clear();
        \Cake\Core\Configure::load('app', 'default', false);
        \Cake\Core\Configure::write('Datasources.default.driver', $this->databaseDrivers[$data['database-datasource']]);
        \Cake\Core\Configure::write('Datasources.default.host', $data['database-host']);
        \Cake\Core\Configure::write('Datasources.default.port', $data['database-port']);
        \Cake\Core\Configure::write('Datasources.default.username', $data['database-username']);
        \Cake\Core\Configure::write('Datasources.default.password', $data['database-password']);
        \Cake\Core\Configure::write('Datasources.default.database', $data['database-database']);

        \Cake\Datasource\ConnectionManager::config(\Cake\Core\Configure::consume('Datasources'));
        $connection = \Cake\Datasource\ConnectionManager::get('default');

        foreach ($schema as $sql) {
            $sql = trim($sql);
            if (empty($sql)) {
                continue;
            }
            $connection->query(str_replace(array_keys($replacements), array_values($replacements), $sql));
        }
    }

    public function moveFiles()
    {
        require $this->tmpDir . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'autoload.php';
        $this->loadPlugin('Acl', true, false, false);
        $this->loadPlugin('Croogo/Core', true, true, false);

        $this->recurseCopy($this->tmpDir, dirname($this->installDir));
    }

    public function runAppInstall()
    {
        $this->requireComposer();

        require $this->tmpDir . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . 'Console' . DIRECTORY_SEPARATOR . 'Installer.php';
        require 'ComposerIo.php';

        $io = new ComposerIo();

        \App\Console\Installer::createAppConfig($this->tmpDir, $io);
        \App\Console\Installer::createWritableDirectories($this->tmpDir, $io);
        \App\Console\Installer::setFolderPermissions($this->tmpDir, $io);
        \App\Console\Installer::setSecuritySalt($this->tmpDir, $io);
    }
}
