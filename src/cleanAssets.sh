#!/bin/bash

if [[ -n "$WERCKER_COMPOSER_INSTALL_CLEAN" && "$WERCKER_COMPOSER_INSTALL_CLEAN" -eq "true"  ]]
then
	if [ -f composer.lock ]; then rm composer.lock; fi;
    if [ -d vendor        ]; then rm -r vendor; fi;
fi
