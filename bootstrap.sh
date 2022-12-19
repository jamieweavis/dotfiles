#!/usr/bin/env bash

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
    --exclude "bin/" \
		--exclude "README.md" \
    --exclude "bootstrap.sh" \
    --exclude "install.sh" \
		--exclude "LICENSE.md" \
		-avh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
