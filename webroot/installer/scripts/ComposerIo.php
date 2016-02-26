<?php

/**
 * Class ComposerIo
 */
class ComposerIo implements \Composer\IO\IOInterface
{
    public function isInteractive()
    {
        // TODO: Implement isInteractive() method.
    }

    public function isVerbose()
    {
        // TODO: Implement isVerbose() method.
    }

    public function isVeryVerbose()
    {
        // TODO: Implement isVeryVerbose() method.
    }

    public function isDebug()
    {
        // TODO: Implement isDebug() method.
    }

    public function isDecorated()
    {
        // TODO: Implement isDecorated() method.
    }

    public function write($messages, $newline = true, $verbosity = self::NORMAL)
    {
        // TODO: Implement write() method.
    }

    public function writeError($messages, $newline = true, $verbosity = self::NORMAL)
    {
        // TODO: Implement writeError() method.
    }

    public function overwrite($messages, $newline = true, $size = null, $verbosity = self::NORMAL)
    {
        // TODO: Implement overwrite() method.
    }

    public function overwriteError($messages, $newline = true, $size = null, $verbosity = self::NORMAL)
    {
        // TODO: Implement overwriteError() method.
    }

    public function ask($question, $default = null)
    {
        // TODO: Implement ask() method.
    }

    public function askConfirmation($question, $default = true)
    {
        // TODO: Implement askConfirmation() method.
    }

    public function askAndValidate($question, $validator, $attempts = null, $default = null)
    {
        // TODO: Implement askAndValidate() method.
    }

    public function askAndHideAnswer($question)
    {
        // TODO: Implement askAndHideAnswer() method.
    }

    public function getAuthentications()
    {
        // TODO: Implement getAuthentications() method.
    }

    public function hasAuthentication($repositoryName)
    {
        // TODO: Implement hasAuthentication() method.
    }

    public function getAuthentication($repositoryName)
    {
        // TODO: Implement getAuthentication() method.
    }

    public function setAuthentication($repositoryName, $username, $password = null)
    {
        // TODO: Implement setAuthentication() method.
    }

    public function loadConfiguration(\Composer\Config $config)
    {
        // TODO: Implement loadConfiguration() method.
    }

}
