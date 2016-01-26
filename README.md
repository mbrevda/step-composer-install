# Composer Install
Runs `composer install` with some nifty initializations. Best tested `composer install` package on wercker!

[![wercker status](https://app.wercker.com/status/c2307a090fc4187cd749b3fb1b54ad52/s "wercker status")](https://app.wercker.com/project/bykey/c2307a090fc4187cd749b3fb1b54ad52)

# Dependencies
* PHP - This build-step depends on an installed php version, if it's missing, the buildstep will fail. Please either install php, or pick a box which has php already installed
* Composer (options) - As composer is needed for this set to complete, the step
will attempt to install it if nesesary

# Options

* `directory` The directory(s)/file(s) to scan. _please add a pipeline variable which sets the path, or make it hardcoded in your wercker.yml_
* `ignore` The directory(s)/file(s) to ignore.
* `standard` The coding standard used to test against; defaults to PSR2.
* `report` Sets the output display format. http://pear.php.net/manual/en/package.php.php-codesniffer.reporting.php

# Example
```yml
box: wercker/php
## Build definition
build:
  # The steps that will be executed on build
  steps:
  - mbrevda/composer-install:
        directory: $DIRECTORY
        standard: PSR2
        ignore: $IGNORE_DIRECTORY
        report: full
deploy:
  steps:

 ```
