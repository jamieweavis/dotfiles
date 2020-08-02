# Load aliases & extra
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.extra ] && source ~/.extra

# Antigen

## Load Antigen
source /usr/local/share/antigen/antigen.zsh

## Load the oh-my-zsh library
antigen use oh-my-zsh

## Load oh-my-zsh plugins
antigen bundle git
antigen bundle command-not-found

## Load plugins
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

## Apply antigen plugins
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

# Theme
eval "$(starship init zsh)"
