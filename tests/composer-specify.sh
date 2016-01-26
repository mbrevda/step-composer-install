#!/bin/bash

function info() {
    if [ "${1}" = "Composer found at /tmp/fakeComposer" ]; then
        passTest "${BASH_SOURCE[0]}"
        . build-esen.sh # only intercept info() once
    else
        failTest "${BASH_SOURCE[0]} (${1})"
    fi
}


touch /tmp/fakeComposer
chmod +x /tmp/fakeComposer

WERCKER_COMPOSER_INSTALL_PATH='/tmp/fakeComposer'
WERCKER_COMPOSER_INSTALL_CACHE='false'
COMPOSER_TEST_PATH=echo
source src/composerPath.sh

rm /tmp/fakeComposer
