#!/opt/homebrew/bin/zsh

set -e

# (1/4) Install dependencies
echo "● Installing Homebrew"
if [ ! "$(command -v brew)" ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "● Installing Brewfile formulae & casks"
brew bundle --file=$(dirname "$0")/bin/Brewfile

echo "● Installing nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
	source "$NVM_DIR/nvm.sh"
	echo "v$(nvm -v) is already installed."
else
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
fi

echo "● Installing Node.js LTS"
nvm install --lts

echo "● Installing tpm"
[[ ! -d ~/.tmux/plugins/tpm ]] && install_tpm=true
if [ $install_tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# (2/4) Symlink dotfiles
echo "● Symlinking dotfiles"
cd $(dirname "$0")
stow . --verbose 2 --adopt --target ~

# (3/4) Install configured plugins
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
