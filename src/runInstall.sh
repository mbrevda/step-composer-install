#!/bin/bash

info "Running composer install..."
# last chance to rename execuable, used for tests
COMPOSER_PATH=${COMPOSER_TEST_PATH:-$COMPOSER_PATH}
$COMPOSER_PATH install $OPTS
