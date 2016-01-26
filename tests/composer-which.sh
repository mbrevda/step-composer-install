#!/bin/bash

function info() {
    if [ "${1}" = "Composer found at /usr/bin/composer" ]; then
        passTest "${BASH_SOURCE[0]}"
        . build-esen.sh # only intercept info() once
    else
        failTest "${BASH_SOURCE[0]} (${1})"
    fi
}

_REMOVE_COMPOSER=false
if [ ! -f /usr/bin/composer ]; then
    _REMOVE_COMPOSER=true
    touch /usr/bin/composer
    chmod +x /usr/bin/composer
fi

WERCKER_COMPOSER_INSTALL_CACHE='false'
COMPOSER_TEST_PATH=echo
source src/composerPath.sh

if [ $_REMOVE_COMPOSER ]; then rm /usr/bin/composer; fi
