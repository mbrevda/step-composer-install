#!/bin/bash

touch composer.lock
mkdir -p vendor
WERCKER_COMPOSER_INSTALL_CLEAN='true'
PASS=false
function info() {
    if [[ -f composer.lock && -d vendor ]]; then
        rm composer.lock; rm -r vendor/
    fi
    PASS=true
    passTest "${BASH_SOURCE[0]}"
}
source src/cleanAssets.sh

if [ ! $PASS ]; then failTest "${BASH_SOURCE[0]}"; fi
