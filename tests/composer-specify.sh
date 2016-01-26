#!/bin/bash

function info() {
    if [ "${1}" = "Composer found at /tmp/fakeComposer" ]; then
        success "${BASH_SOURCE[0]} completed succesfully"
        . build-esen.sh # only intercept info() once
    else
        fail "${BASH_SOURCE[0]} failed (${1})"
    fi
}


touch /tmp/fakeComposer
chmod +x /tmp/fakeComposer

WERCKER_COMPOSER_INSTALL_PATH='/tmp/fakeComposer'
WERCKER_COMPOSER_INSTALL_CACHE='false'
COMPOSER_TEST_PATH=echo
. run.sh

rm /tmp/fakeComposer
