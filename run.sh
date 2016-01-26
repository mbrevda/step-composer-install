#!/bin/bash

# dont check case when comparing values
shopt -s nocasematch

# ensure composer exists or install it
set +e
COMPOSER_PATH=$(which composer)
set -e
if [ -z $COMPOSER_PATH ]
then
	if [ -n "$WERCKER_COMPOSER_INSTALL_PATH" ]
	then
		if [ -f "$WERCKER_COMPOSER_INSTALL_PATH" ]; then
	    	COMPOSER_PATH=$WERCKER_COMPOSER_INSTALL_PATH
		else
			fail "Composer not found at specifed path $WERCKER_COMPOSER_INSTALL_PATH"
		fi
	else
		info "Installing composer..."
		curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
		COMPOSER_PATH=/usr/local/bin/composer
	fi
fi
if [ -n $COMPOSER_PATH ]; then
	info "Composer found at $COMPOSER_PATH"
else
	fail "Unable to find composer"
fi

# set cache
if [[ -z "$WERCKER_COMPOSER_INSTALL_CACHE"  || "$WERCKER_COMPOSER_INSTALL_CACHE" -ne "false" ]]
then
	if [ -n "$WERCKER_COMPOSER_INSTALL_CACHE"]; then CACHE_DIR=$WERCKER_COMPOSER_INSTALL_CACHE; fi
	CACHE_DIR=${CACHE_DIR-"$WERCKER_CACHE_DIR/.composer/cache"}
    $COMPOSER_PATH config cache-dir $CACHE_DIR
fi

# clean assets (useful for cases like local docker builds)
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

info "Running composer install..."
# last chance to rename execuable, used for tests
COMPOSER_PATH=${COMPOSER_TEST_PATH:-$COMPOSER_PATH}
$COMPOSER_PATH install $OPTS

if [ $? -ne "0" ]
then
    fail "Composer installed failed"
else
    success "Composer installed completed successfully!"
fi
