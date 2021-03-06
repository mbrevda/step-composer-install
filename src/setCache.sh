#!/bin/bash

if [[ -z "$WERCKER_COMPOSER_INSTALL_CACHE"  || "$WERCKER_COMPOSER_INSTALL_CACHE" != "false" ]]
then
	if [ -n "$WERCKER_COMPOSER_INSTALL_CACHE" ]; then CACHE_DIR=$WERCKER_COMPOSER_INSTALL_CACHE; fi
	CACHE_DIR=${CACHE_DIR:-"$WERCKER_CACHE_DIR/.composer/cache"}
    $COMPOSER_PATH config cache-dir $CACHE_DIR
fi
