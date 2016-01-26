#!/bin/bash

function info() {
    if [ "${1}" = "Composer found at /usr/bin/composer" ]; then
        success "${BASH_SOURCE[0]} completed succesfully"
        . build-esen.sh # only intercept info() once
    else
        fail "${BASH_SOURCE[0]} failed"
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
. run.sh

if [ $_REMOVE_COMPOSER ]; then rm /usr/bin/composer; fi
