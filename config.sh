#!/usr/bin/env sh
set -u

GITCONFIG_DEFAULT_PREFIX="${HOME}/.rc.gitconfig"

CONFIG_INSTALL () {
	GITCONFIG_PREFIX=${1:-$GITCONFIG_DEFAULT_PREFIX}

	# TODO check if the same include.path exists.
	git config --global --add include.path "${GITCONFIG_PREFIX}/config"
}

CONFIG_HELP () {
	echo 'Usage: config.sh {install [prefix_path]|help}'
}

if [ $# -gt 0 ]; then
	OP=$1
	shift
fi
case ${OP:-} in
	"install")
		CONFIG_INSTALL $@
		;;
	"help")
		CONFIG_HELP $@
		;;
	*)
		CONFIG_HELP $@
		exit 1
		;;
esac
