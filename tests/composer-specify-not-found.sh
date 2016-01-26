#!/bin/bash

function fail() {
    if  [ "${1}" = "Unable to find composer" ]; then return 0; fi
    if [ "${1}" = "Composer not found at specifed path /tmp/fakeComposer" ]; then
        passTest "${BASH_SOURCE[0]}"
    else
        failTest "${BASH_SOURCE[0]} (${1})"
    fi
}


WERCKER_COMPOSER_INSTALL_PATH='/tmp/fakeComposer'
WERCKER_COMPOSER_INSTALL_CACHE='false'
COMPOSER_TEST_PATH=echo
source src/composerPath.sh
