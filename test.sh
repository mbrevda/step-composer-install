#!/bin/bash
PS4='+($?) $BASH_SOURCE:$FUNCNAME:$LINENO:'
#set -x
. build-esen.sh

function passTest() {
    _message "\t✓ ${1}" $SUCCESS_COLOR
}

function failTest() {
    _message "\t✗ ${1}" $ERROR_COLOR
    exit 1
}

_message "Running tests..." $INFO_COLOR

for i in tests/*; do
    . build-esen.sh
    source "$i"
done

_message "All tests completed successfully!" $SUCCESS_COLOR
