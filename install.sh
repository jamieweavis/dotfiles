#!/bin/sh

set -e

if [ ! "$(command -v brew)" ]; then
	echo "Homebrew not found, installing..."

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Homebrew already installed, proceeding."
fi

echo "Installing Hombrew dependencies listed in Brewfile..."
brew bundle

echo "Installing Vim plugins..."
vim +PlugInstall +qall

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

echo "Symlinking dotfiles..."
stow . --adopt --target ~
