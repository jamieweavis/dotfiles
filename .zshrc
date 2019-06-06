# Load aliases & extra
[ -f ~/.zsh_prompt ] && source ~/.zsh_prompt
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.extra ] && source ~/.extra

# Antigen

## Load Antigen
source /usr/local/share/antigen/antigen.zsh

## Load the oh-my-zsh library
antigen use oh-my-zsh

## Load plugins
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

## Load spaceship theme
antigen theme denysdovhan/spaceship-prompt

## Let's go
antigen apply

# Binds

## Bind history-substring-search
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down

# Path

## yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

## nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/zsh_completion" ] && . "/usr/local/opt/nvm/etc/zsh_completion"

