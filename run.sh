#!/bin/bash
if hash php 2>/dev/null
then
	info "php version $(php --version) found"
	info "from location $(which php)"
else
   	fail "PHP not found!"
fi

PWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $PWD/src/composerPath.sh
source $PWD/src/setCache.sh
source $PWD/src/cleanAssets.sh
source $PWD/src/installOpts.sh
source $PWD/src/runInstall.sh
source $PWD/src/summary.sh
