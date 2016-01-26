#!/bin/bash

function fail() {
    . build-esen.sh # only intercept info() once
    if [ "${1}" = "Composer not found at specifed path /tmp/fakeComposer" ]; then
        success "${BASH_SOURCE[0]} completed succesfully"
    else
        fail "${BASH_SOURCE[0]} failed (${1})"
    fi
}


WERCKER_COMPOSER_INSTALL_PATH='/tmp/fakeComposer'
WERCKER_COMPOSER_INSTALL_CACHE='false'
COMPOSER_TEST_PATH=echo
. run.sh
