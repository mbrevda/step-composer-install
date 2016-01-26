#!/bin/bash

touch composer.lock
mkdir -p vendor
WERCKER_COMPOSER_INSTALL_CLEAN='false'
source src/cleanAssets.sh

if [[ -f composer.lock && -d vendor ]]; then
    rm composer.lock; rm -r vendor/
    passTest "${BASH_SOURCE[0]}"
else
    failTest "${BASH_SOURCE[0]} ($@)"
fi
