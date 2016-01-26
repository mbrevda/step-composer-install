#!/bin/bash
PS4='+($?) $BASH_SOURCE:$FUNCNAME:$LINENO:'
#set -x

for i in tests/*; do
    . build-esen.sh
    source "$i"
done

RESULT=$?
if [[ $RESULT -ne "0" ]]; then
    echo "Test: FAIL -> $RESULT"
    return 1 2>/dev/null || exit 1
else
	echo "done"
fi
