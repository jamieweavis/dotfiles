#!/opt/homebrew/bin/zsh

set -e

echo "● Installing Homebrew"
if [ ! "$(command -v brew)" ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "● Installing Brewfile formulae & casks"
brew bundle --file=bin/Brewfile

echo "● Installing nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
	source "$NVM_DIR/nvm.sh"
	echo "v$(nvm -v) is already installed."
else
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
fi

echo "● Installing Node.js LTS"
nvm install --lts

# Symlink dotfiles with GNU Stow
echo "● Symlinking dotfiles"
stow . --verbose 2 --adopt --target ~

# Install nvim plugins
echo "● Installing nvim plugins"
nvim --headless "+Lazy! sync" +qa

# Source .zshrc
echo "\n● Installation complete - sourcing ~/.zshrc 🚀"
source ~/.zshrc
