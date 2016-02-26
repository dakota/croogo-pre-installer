<?php
require 'scripts/checkRequirements.php';
$directory = dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'croogo';

$exists = is_dir($directory);
if (!$exists) {
    mkdir($directory);
    $exists = is_dir($directory);
}

$writable = is_writable($directory);
$phpVersion = phpversion();
$minimumPhpVersion = '5.5.9';
$versionOk = version_compare($phpVersion, $minimumPhpVersion, 'ge');
$requiredExtensions = checkRequiredExtensions();
$availableDrivers = availableDrivers();
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
                        <a href="#first" data-toggle="tab" class="nav-link" data-next="true" data-previous="false">Welcome</a>
                    </li>
                    <li class="nav-item">
                        <a href="#database-config" data-toggle="tab" class="nav-link" data-next="true"
                           data-previous="true">Database configuration</a>
                    </li>
                    <li class="nav-item">
                        <a href="#site-details" data-toggle="tab" class="nav-link" data-next="true"
                           data-previous="false">Site details</a>
                    </li>
                    <li class="nav-item">
                        <a href="#install-croogo"
                           data-toggle="tab"
                           class="nav-link"
                           data-next="true"
                           data-previous="false">Install Croogo</a>
                    </li>
                    <li class="nav-item">
                        <a href="#finalise" data-toggle="tab" class="nav-link" data-next="false" data-previous="false">Finalise</a>
                    </li>
                </ul>
                <div class="tab-content" id="tab-content">
                    <div class="tab-pane fade" id="first" role="tabpanel">
                        <?php if (!$exists ||
                            !$writable ||
                            !$versionOk ||
                            $requiredExtensions !== true ||
                            empty($availableDrivers)
                        ) : ?>
                            <p class="lead">
                                Unfortunately Croogo cannot be installed at this time as certain minimum requirements
                                have not been met.
                                Please consult the list below to see what issues there are and guides on how to correct
                                these issues.
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
                                <?php if (!$versionOk) : ?>
                                    <div class="list-group-item list-group-item-danger">
                                        <h4 class="list-group-item-heading">Outdated PHP version</h4>
                                        <p class="list-group-item-text">
                                            Croogo requires at least PHP version <?php echo $minimumPhpVersion ?>.
                                            Unfortunately
                                            your webserver is running <?php echo $phpVersion ?> which is older than the
                                            minimum
                                            required. Please contact your hosting provider and ask them to upgrade your
                                            PHP
                                            installation to at least <?php echo $minimumPhpVersion ?>.
                                        </p>
                                    </div>
                                <?php endif; ?>
                                <?php if ($requiredExtensions !== true) : ?>
                                    <div class="list-group-item list-group-item-danger">
                                        <h4 class="list-group-item-heading">Missing PHP required extensions</h4>
                                        <p class="list-group-item-text">
                                            Your webserver is missing the following required extensions:
                                            <?php echo implode(', ', $requiredExtensions) ?>. Please contact your
                                            hosting
                                            provider and ask them to install the extensions.
                                        </p>
                                    </div>
                                <?php endif; ?>
                                <?php if (empty($availableDrivers)) : ?>
                                    <div class="list-group-item list-group-item-warning">
                                        <h4 class="list-group-item-heading">Missing PHP database drivers</h4>
                                        <p class="list-group-item-text">
                                            Your webserver does not have any PDO database drivers installed. Please
                                            contact your
                                            hosting provider and ask them to install the required drivers.
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
                                Once you are ready, click on the button below. If everything goes according to plan
                                you'll
                                be whisked through the next couple of steps automatically. While this is going on,
                                please
                                do not refresh or navigate away from this page!
                            </p>
                            <div class="center-block">
                                <button type="button" class="btn btn-success btn-lg btn-block"
                                   data-action="next">
                                    Let's get the party started!
                                </button>
                            </div>
                        <?php endif; ?>
                    </div>
                    <div class="tab-pane fade" id="database-config" role="tabpanel">
                        <form>
                            <fieldset>
                                <legend>Database server details</legend>
                                <div class="form-group row">
                                    <label for="database-datasource" class="col-sm-3 form-control-label">Database</label>
                                    <div class="col-sm-9">
                                        <select class="form-control c-select" id="database-datasource" name="database-datasource" required>
                                            <?php foreach ($availableDrivers as $driver) : ?>
                                            <option value="<?php echo $driver ?>"><?php echo $driver ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                        <small class="text-muted">Type of database server your web server is running. This is usually MySQL
                                        </small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="database-host" class="col-sm-3 form-control-label">
                                        Database hostname or IP Address
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="database-host" name="database-host" value="localhost" required>
                                        <small class="text-muted">This is normally <em>localhost</em>, your hosting provider will normally tell you
                                        if it needs to be something else.</small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="database-port" class="col-sm-3 form-control-label">
                                        Database port
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="database-port" name="database-port">
                                        <small class="text-muted">Leave this blank if you don't know what it should be</small>
                                    </div>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>Database access details</legend>
                                <div class="form-group row">
                                    <label for="database-database" class="col-sm-3 form-control-label">
                                        Database name
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="database-database" name="database-database" required>
                                        <small class="text-muted">The name of the database you want to install Croogo too
                                        </small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="database-username" class="col-sm-3 form-control-label">
                                        Database username
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="database-username" name="database-username" required>
                                        <small class="text-muted">The username that your host has provided for accessing your database</small>
                                    </div>

                                </div>
                                <div class="form-group row">
                                    <label for="database-password" class="col-sm-3 form-control-label">
                                        Database password
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="database-password" name="database-password" required>
                                        <small class="text-muted">The password that your host has provided for accessing your
                                            database
                                        </small>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="row">
                                <div class="pull-left">
                                    <button type="button" class="btn btn-primary"
                                            data-action="previous">
                                        Previous step
                                    </button>
                                </div>
                                <div class="pull-right">
                                    <button type="button" class="btn btn-primary"
                                            data-action="next">
                                        Next step
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="site-details" role="tabpanel">
                        <form>
                            <fieldset>
                                <legend>Site details</legend>
                                <div class="form-group row">
                                    <label for="site-name" class="col-sm-3 form-control-label">Site name</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" id="site-name" name="site-name" value="Croogo - Content Management System" required />
                                        <small class="text-muted">
                                            The name of your website.
                                        </small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="site-tagline" class="col-sm-3 form-control-label">Tagline</label>
                                    <div class="col-sm-9">
                                        <input class="form-control"
                                               id="site-tagline" name="site-tagline"
                                               value="A CakePHP powered Content Management System."
                                               required/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="site-description" class="col-sm-3 form-control-label">Description</label>
                                    <div class="col-sm-9">
                                        <input class="form-control"
                                               id="site-description" name="site-description"
                                               value="Croogo - A CakePHP powered Content Management System"
                                               required/>
                                        <small class="text-muted">
                                            Metadata description for SEO purposes.
                                        </small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="site-keywords" class="col-sm-3 form-control-label">Keywords</label>
                                    <div class="col-sm-9">
                                        <input class="form-control"
                                               id="site-keywords" name="site-keywords"
                                               value="croogo, croogo, cakephp"
                                               required/>
                                        <small class="text-muted">
                                            Metadata keywords for SEO purposes.
                                        </small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="site-email" class="col-sm-3 form-control-label">Site email address</label>
                                    <div class="col-sm-9">
                                        <input class="form-control"
                                               id="site-email" name="site-email"
                                               value="you@example.com"
                                               required/>
                                        <small class="text-muted">
                                            Site email address.
                                        </small>
                                    </div>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>Administrator</legend>
                                <div class="form-group row">
                                    <label for="admin-username" class="col-sm-3 form-control-label">
                                        Admin username
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="admin-username" name="admin-username" value="admin" required>
                                        <small class="text-muted">
                                            Username for the main administration user.
                                        </small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="admin-password" class="col-sm-3 form-control-label">
                                        Admin password
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="admin-password" name="admin-password" value="admin" required>
                                        <small class="text-muted">
                                            Password for the main administration user.
                                        </small>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="row">
                                <div class="pull-left">
                                    <button type="button" class="btn btn-primary"
                                            data-action="previous">
                                        Previous step
                                    </button>
                                </div>
                                <div class="pull-right">
                                    <button type="button" class="btn btn-primary"
                                            data-action="next">
                                        Next step
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="install-croogo" role="tabpanel">
                        <p class="lead">
                            We will now attempt to download and configure your new Croogo installation.
                        </p>
                        <div>
                            <ul class="list-unstyled list"></ul>
                        </div>
                        <div class="row">
                            <div class="pull-right">
                                <button type="button" class="btn btn-primary disabled"
                                        data-action="next">
                                    Next step
                                </button>
                            </div>
                        </div>
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
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js"
    integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7"
    crossorigin="anonymous"></script>
<script src="/installer/assets/js/ajaxQueue.js"></script>
<script src="/installer/assets/js/app.js"></script>
</body>
</html>
