# Aliases
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.aliases.local ] && source ~/.aliases.local

# Bind Ctrl + R to search history
bindkey '^R' history-incremental-search-backward

# Load nvm & default installed version of node (~0.5s)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Enable history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# Enable tab completion visual selection
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# Case insensitive tab completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Homebrew (~.03s)
export PATH="/opt/homebrew/sbin:$PATH"
eval $(/opt/homebrew/bin/brew shellenv)

# Enable cd without cd
setopt AUTO_CD

# Set default editor to neovim
export VISUAL=nvim
export EDITOR="$VISUAL"

# Source untracked local zsh config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Starship prompt (https://starship.rs/)
eval "$(starship init zsh)"
