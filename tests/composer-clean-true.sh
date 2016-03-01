#!/bin/bash

touch composer.lock
mkdir -p vendor
WERCKER_COMPOSER_INSTALL_CLEAN='true'
source src/cleanAssets.sh

if [[ -f composer.lock && -d vendor ]]; then
    rm composer.lock; rm -r vendor/
    failTest "${BASH_SOURCE[0]} ($@)"
else
    passTest "${BASH_SOURCE[0]}"
fi
