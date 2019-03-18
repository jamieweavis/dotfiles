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

## Lazy load nvm
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

## Load spaceship theme
antigen theme denysdovhan/spaceship-prompt

## Let's go
antigen apply

# Binds

## Bind history-substring-search
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
