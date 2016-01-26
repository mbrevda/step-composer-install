#!/bin/bash
PS4='+($?) $BASH_SOURCE:$FUNCNAME:$LINENO:'
#set -x
_COMPOSER_DIR=/usr/local/bin/composer
if [[ $CI = "true" && -f /home/ubuntu/.phpenv/shims/composer ]]; then
    _COMPOSER_DIR=/home/ubuntu/.phpenv/shims/
    rm /home/ubuntu/.phpenv/shims/composer
fi

function passTest() {
    _message "  ✓ ${1}" $SUCCESS_COLOR
}

function failTest() {
    _message "  ✗ ${1}" $ERROR_COLOR
    exit 1
}

function reset() {
    if [ -f init.sh ]; then
        source init.sh
    else
        source build-esen.sh
    fi
}

reset

_message "Running tests..." $INFO_COLOR

for i in tests/*; do
    reset
    source "$i"
done

_message "All tests completed successfully!" $SUCCESS_COLOR
