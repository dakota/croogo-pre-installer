<?php
$result = [];
$version = phpversion();
$result['ok'] = version_compare($version, '5.5.9', 'ge');
$result['text'] = $version . ' is installed';

require('output.php');
