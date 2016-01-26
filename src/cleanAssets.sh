#!/bin/bash

if [[ -z "$WERCKER_COMPOSER_INSTALL_CLEAN" || "$WERCKER_COMPOSER_INSTALL_CLEAN" -ne "false"  ]]
then
	if [ -f composer.lock ]; then rm composer.lock; fi;
    if [ -d vendor        ]; then rm -r vendor; fi;
fi

if [ -n "$WERCKER_COMPOSER_INSTALL_OPTS"]
then
	OPTS="$WERCKER_COMPOSER_INSTALL_OPTS"
else
	OPTS="--no-interaction"
fi
