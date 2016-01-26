#!/bin/bash

function test() {
    if [ "${1} ${2} ${3}" = "config cache-dir foo/.composer/cache" ]; then
        passTest "${BASH_SOURCE[0]}"
    else
        failTest "${BASH_SOURCE[0]} (${1})"
    fi
}


WERCKER_CACHE_DIR=foo
COMPOSER_PATH=test
source src/setCache.sh
