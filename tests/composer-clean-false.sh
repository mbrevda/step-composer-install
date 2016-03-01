#!/bin/bash

touch composer.lock
mkdir -p vendor
WERCKER_COMPOSER_INSTALL_CLEAN='false'

function info() {
    rm composer.lock; rm -r vendor/
    failTest "${BASH_SOURCE[0]} ($@)"
}
source src/cleanAssets.sh
passTest "${BASH_SOURCE[0]}"
