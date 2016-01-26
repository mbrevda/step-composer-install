#!/bin/bash


function info() {
    if [ "${1}" = "Installing composer..." ]; then return;fi

    . build-esen.sh # only intercept info() once
    if [ "${1}" = "Composer found at $_COMPOSER_DIR/composer" ]; then
        passTest "${BASH_SOURCE[0]}"
    else
        failTest "${BASH_SOURCE[0]} - (${1})"
    fi
}


WERCKER_COMPOSER_INSTALL_CACHE='false'
COMPOSER_PATH=echo
source src/composerPath.sh

rm $_COMPOSER_DIR/composer
