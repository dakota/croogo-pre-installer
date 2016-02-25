<?php
require 'scripts/checkRequirements.php';
$directory = dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'croogo';

$exists = is_dir($directory);
$writable = is_writable($directory);
$isEmpty = is_empty($directory);
$phpVersion = phpversion();
$minimumPhpVersion = '5.5.9';
$versionOk = version_compare($phpVersion, $minimumPhpVersion, 'ge');
$requiredExtensions = checkRequiredExtensions();
$databaseExtensions = databaseExtensions();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Croogo Pre-installer</title>
    <link rel="stylesheet" href="assets/css/styles.css" type="text/css">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
          integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body>
    <div class="install">
        <div id="main" class="container">
            <div class="card installer">
                <h3 class="card-header">Croogo Pre-installer</h3>
                <div class="card-block">
                    <ul class="nav nav-pills" id="tab-buttons">
                        <li class="nav-item">
                            <a href="#first" data-toggle="tab" class="nav-link" data-next="false" data-previous="false">Welcome</a>
                        </li>
                        <li class="nav-item">
                            <a href="#database-config" data-toggle="tab" class="nav-link" data-next="auto"
                               data-previous="false">Database configuration</a>
                        </li>
                        <li class="nav-item">
                            <a href="#site-details" data-toggle="tab" class="nav-link" data-next="true"
                               data-previous="false">Site details</a>
                        </li>
                        <li class="nav-item">
                            <a href="#install-croogo" data-toggle="tab" class="nav-link" data-next="auto" data-previous="false">Install Croogo</a>
                        </li>
                        <li class="nav-item">
                            <a href="#finalise" data-toggle="tab" class="nav-link" data-next="false" data-previous="false">Finalise</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="tab-content">
                        <div class="tab-pane fade" id="first" role="tabpanel">
                            <?php if (!$exists || !$writable || !$isEmpty || !$versionOk || $requiredExtensions !== true ||
                                $databaseExtensions !== true) : ?>
                                <p class="lead">
                                    Unfortunately Croogo cannot be installed at this time as certain minimum requirements have not been met.
                                    Please consult the list below to see what issues there are and guides on how to correct these issues.
                                </p>
                                <div class="list-group">
                                    <?php if (!$exists) : ?>
                                        <div class="list-group-item list-group-item-danger">
                                            <h4 class="list-group-item-heading">Install folder does not exist</h4>
                                            <p class="list-group-item-text">
                                                The <code><?php echo $directory ?></code> folder does not exist.
                                                The Croogo installer uses this folder to download all required files.
                                                Please create the folder and ensure that it is writable.
                                            </p>
                                        </div>
                                    <?php endif; ?>
                                    <?php if ($exists && !$writable) : ?>
                                    <div class="list-group-item list-group-item-danger">
                                        <h4 class="list-group-item-heading">Install folder is not writable</h4>
                                        <p class="list-group-item-text">
                                            The <code><?php echo $directory ?></code> folder is currently not writable.
                                            The Croogo installer uses this folder to download all required files.
                                            Please ensure that the folder is writable.
                                        </p>
                                    </div>
                                    <?php endif; ?>
                                    <?php if ($exists && $writable && !$isEmpty) : ?>
                                        <div class="list-group-item list-group-item-danger">
                                            <h4 class="list-group-item-heading">Install folder is not empty</h4>
                                            <p class="list-group-item-text">
                                                The <code><?php echo $directory ?></code> folder is currently not
                                                empty. The Croogo installer uses this folder to download all required
                                                files and requires it to be empty for security and safety purposes (To prevent
                                                existing scripts/installations from being overwritten). If you are sure you want
                                                to perform a new install of Croogo, please delete all files in the folder.
                                            </p>
                                        </div>
                                    <?php endif; ?>
                                    <?php if (!$versionOk) : ?>
                                        <div class="list-group-item list-group-item-danger">
                                            <h4 class="list-group-item-heading">Outdated PHP version</h4>
                                            <p class="list-group-item-text">
                                                Croogo requires at least PHP version <?php echo $minimumPhpVersion ?>. Unfortunately
                                                your webserver is running <?php echo $phpVersion ?> which is older than the minimum
                                                required. Please contact your hosting provider and ask them to upgrade your PHP
                                                installation to at least <?php echo $minimumPhpVersion ?>.
                                            </p>
                                        </div>
                                    <?php endif; ?>
                                    <?php if ($requiredExtensions !== true) : ?>
                                        <div class="list-group-item list-group-item-danger">
                                            <h4 class="list-group-item-heading">Missing PHP required extensions</h4>
                                            <p class="list-group-item-text">
                                                Your webserver is missing the following required extensions:
                                                <?php echo implode(', ', $requiredExtensions) ?>. Please contact your hosting
                                                provider and ask them to install the extensions.
                                            </p>
                                        </div>
                                    <?php endif; ?>
                                    <?php if ($databaseExtensions !== true) : ?>
                                        <div class="list-group-item list-group-item-warning">
                                            <h4 class="list-group-item-heading">Missing PHP database extensions</h4>
                                            <p class="list-group-item-text">
                                                Your webserver is missing at least one the following extensions:
                                                <?php echo implode(', ', $databaseExtensions) ?>. These extensions are
                                                used to communicate with the database. Please contact your
                                                hosting provider and ask them to install the extensions.
                                            </p>
                                        </div>
                                    <?php endif; ?>
                                </div>
                            <?php else : ?>
                                <p class="lead">
                                    Welcome to Croogo. This simple installer script will guide you through the process of
                                    installing Croogo. It will download all files and scripts that Croogo needs to run
                                    and ask you a few questions about your website and hosting environment.
                                </p>
                                <p>Please make sure that you have the following information ready before proceeding.</p>
                                <ul>
                                    <li>Database type</li>
                                    <li>Database name</li>
                                    <li>Database username</li>
                                    <li>Database password</li>
                                    <li>Database hostname</li>
                                </ul>
                                <p>
                                    This information will be used to create a database configuration file and create all the
                                    database tables that Croogo needs.
                                </p>
                                <p>
                                    Once you are ready, click on the button below. If everything goes according to plan you'll
                                    be whisked through the next couple of steps automatically. While this is going on, please
                                    do not refresh or navigate away from this page!
                                </p>
                                <div class="center-block">
                                    <a href="#install-croogo" class="btn btn-success btn-lg btn-block" data-toggle="switch-tab">
                                        Let's get the party started!
                                    </a>
                                </div>
                            <?php endif; ?>
                        </div>
                        <div class="tab-pane fade" id="install-croogo" role="tabpanel">
                            <p class="lead">
                                We will now attempt to download
                            </p>
                            <div>
                                <ul class="list-unstyled list"></ul>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="database-config" role="tabpanel">
                        </div>
                        <div class="tab-pane fade" id="site-details" role="tabpanel">
                        </div>
                        <div class="tab-pane fade" id="build-site" role="tabpanel">
                        </div>
                        <div class="tab-pane fade" id="finalise" role="tabpanel">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script
    src = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js"
    integrity = "sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7"
    crossorigin = "anonymous" ></script>
    <script src="/installer/assets/js/ajaxQueue.js"></script>
    <script src="/installer/assets/js/app.js"></script>
</body>
</html>
