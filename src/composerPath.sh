#!/bin/bash
# dont check case when comparing values
_COMPOSER_DIR=${_COMPOSER_DIR-"/usr/local/bin"}
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
		curl -sS https://getcomposer.org/installer | php -- --install-dir=$_COMPOSER_DIR --filename=composer --quiet
		COMPOSER_PATH=$_COMPOSER_DIR/composer
	fi
fi
if [ -n "$COMPOSER_PATH" ]; then
	info "Composer found at $COMPOSER_PATH"
else
	fail "Unable to find composer"
fi
