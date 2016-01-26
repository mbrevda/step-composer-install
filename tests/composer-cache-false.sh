#!/bin/bash

function test() {
    failTest "${BASH_SOURCE[0]} (${1})"
}


WERCKER_COMPOSER_INSTALL_CACHE='false'
COMPOSER_PATH=test
source src/setCache.sh

passTest "${BASH_SOURCE[0]}"
