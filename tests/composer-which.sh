#!/bin/bash

function info() {
    if [ "${1}" = "Composer found at $_COMPOSER_DIR/composer" ]; then
        passTest "${BASH_SOURCE[0]}"
        . build-esen.sh # only intercept info() once
    else
        failTest "${BASH_SOURCE[0]} (${1})"
    fi
}

_REMOVE_COMPOSER=false
if [ ! -f $_COMPOSER_DIR/composer ]; then
    _REMOVE_COMPOSER=true
    touch $_COMPOSER_DIR/composer
    chmod +x $_COMPOSER_DIR/composer
fi

WERCKER_COMPOSER_INSTALL_CACHE='false'
COMPOSER_PATH=echo
source src/composerPath.sh

if [ $_REMOVE_COMPOSER ]; then rm $_COMPOSER_DIR/composer; fi
