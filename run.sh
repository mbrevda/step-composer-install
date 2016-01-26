#!/bin/bash
if hash php 2>/dev/null
then
	info "php version $(php --version) found"
	info "from location $(which php)"
else
   	fail "PHP not found!"
fi

source ./src/composerPath.sh
source ./src/setCache.sh
source ./src/cleanAssets.sh
source ./src/installOpts.sh
source ./src/runInstall.sh
source ./src/summary.sh
