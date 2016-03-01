#!/bin/bash

unset WERCKER_COMPOSER_INSTALL_CLEAN
touch composer.lock
mkdir -p vendor
source src/cleanAssets.sh

if [[ ! -f composer.lock && ! -d vendor ]]; then
    failTest "${BASH_SOURCE[0]} ($@)"
else
    passTest "${BASH_SOURCE[0]}"
fi
