#!/bin/bash

function info() {
    :
}

PASS=false

function test() {
    PASS=true
    passTest "${BASH_SOURCE[0]}"
}

WERCKER_COMPOSER_INSTALL_CACHE='false'
COMPOSER_PATH=test
source src/runInstall.sh

if [ ! $PASS ]; then failTest "${BASH_SOURCE[0]}"; fi
