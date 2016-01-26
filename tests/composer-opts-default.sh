#!/bin/bash

unset WERCKER_COMPOSER_INSTALL_OPTS
source src/installOpts.sh

if [[ $OPTS = '--no-interaction' ]]; then
    passTest "${BASH_SOURCE[0]}"
else
    failTest "${BASH_SOURCE[0]} ($@)"
fi
