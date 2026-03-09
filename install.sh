#!/bin/zsh

set -e

cd $(dirname "$0")

# (1/4) Install dependencies
echo "● Installing Homebrew"
if [ ! "$(command -v brew)" ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "● Installing Brewfile formulae & casks"
brew bundle --file=./.config/brew/Brewfile

echo "● Installing tpm"
[[ ! -d ~/.tmux/plugins/tpm ]] && install_tpm=true
if [ $install_tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# (2/4) Symlink dotfiles
echo "● Symlinking dotfiles"
stow . --verbose 2 --adopt --target ~

# (3/4) Install plugins
echo "● Installing nvim plugins"
nvim --headless "+Lazy! sync" +qa

echo "● Installing tpm plugins"
if [ $install_tpm ]; then
	~/.tmux/plugins/tpm/bin/install_plugins
else
	~/.tmux/plugins/tpm/bin/update_plugins all
fi

# (4/4) Finally source ~/.zshrc
echo "\n● Installation complete - sourcing ~/.zshrc 🚀"
source ~/.zshrc
