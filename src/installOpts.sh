#!/bin/bash

if [ -n "$WERCKER_COMPOSER_INSTALL_OPTS" ]
then
	OPTS="$WERCKER_COMPOSER_INSTALL_OPTS"
else
	OPTS="--no-interaction"
fi
