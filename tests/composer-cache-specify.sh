#!/bin/bash

function test() {
    if [ "${1} ${2} ${3}" = "config cache-dir foo/bar" ]; then
        passTest "${BASH_SOURCE[0]}"
    else
        failTest "${BASH_SOURCE[0]} ($@)"
    fi
}


WERCKER_COMPOSER_INSTALL_CACHE='foo/bar'
COMPOSER_PATH=test
source src/setCache.sh
