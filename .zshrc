# Load aliases & extra
[ -f ~/.zsh_prompt ] && source ~/.zsh_prompt
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.extra ] && source ~/.extra

# Highlight tab completion
zstyle ':completion:*' menu select

# Persist history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Antigen

## Load Antigen
source /usr/local/share/antigen/antigen.zsh

## Load plugins
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

## Lazy load nvm
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

## Load spaceship theme
antigen theme denysdovhan/spaceship-prompt

## Let's go
antigen apply
