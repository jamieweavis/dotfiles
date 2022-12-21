#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y curl git vim zsh

mkdir -p ~/Projects
git clone https://github.com/jamieweavis/dotfiles.git ~/Projects/dotfiles
(cd ~/Projects/dotfiles/ ; bash ./bootstrap.sh -f)

chsh -s /usr/bin/zsh
curl -L git.io/antigen > antigen.zsh
echo 'export EMOJI="✨"' >> .aliases-local
exec zsh

echo -e "Successfully bootstrapped `hostname`! 🚀"

