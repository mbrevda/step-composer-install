# Composer Install
Runs `composer install` with some nifty initializations. Best tested `composer install` package on wercker!

[![wercker status](https://app.wercker.com/status/c2307a090fc4187cd749b3fb1b54ad52/s "wercker status")](https://app.wercker.com/project/bykey/c2307a090fc4187cd749b3fb1b54ad52)

# Dependencies
* PHP - This build-step depends on an installed php version, if it's missing, the buildstep will fail. Please either install php, or pick a box which has php already installed
* Composer (optional) - As composer is needed for this set to complete, the step
will attempt to install it if necessary

# Options
* `path` (optional) The path to composer, if installed. If composer isn't found, it will be attempted to install to `/usr/local/bin/composer`
* `opts` (optional) Install opts to be passed to composer. Defaults to `--no-interaction`
* `clean` (optional) If we should attempt to remove composer.lock and vendor/ before installing. This is useful for docker builds where files are copied and symlinks get broken. Set to `false` to prevent
* `cache` (optional) Path to composer's cache dir. Defaults to `$WERCKER_CACHE_DIR/.composer/cache`. Set to `false` to disable

# Example
```yml
box: wercker/php
## Build definition
build:
  # The steps that will be executed on build
  steps:
  - mbrevda/composer-install:
        path: /path/to/composer
        opts: --some-opt --another-opts
        clean: false
        cache: /path/to/cache
deploy:
  steps:

 ```
