#!/bin/bash

WERCKER_COMPOSER_INSTALL_OPTS="foobar"
source src/installOpts.sh

if [[ $OPTS = "foobar" ]]; then
    passTest "${BASH_SOURCE[0]}"
else
    failTest "${BASH_SOURCE[0]} ($@)"
fi
