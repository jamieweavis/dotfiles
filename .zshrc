# Aliases
[ -f ~/.aliases/aliases ] && source ~/.aliases/aliases
[ -f ~/.aliases/local ] && source ~/.aliases/local

# Antigen
[[ -e "/opt/homebrew/share/antigen/antigen.zsh" ]] && source "/opt/homebrew/share/antigen/antigen.zsh" ## macOS
[[ -e "antigen.zsh" ]] && source "antigen.zsh" ## Linux
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen apply

# Keybinds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Plugin configuration
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=cyan,fg=black,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta'

# Colourise generic output with grc
[[ -e "/opt/homebrew/etc/grc.zsh" ]] && source "/opt/homebrew/etc/grc.zsh" ## macOS
[[ -e "/etc/grc.zsh" ]] && source "/etc/grc.zsh" ## Linux

# Load nvm (this is slow!)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Homebrew sbin
export PATH="/opt/homebrew/sbin:$PATH"

# Minimal custom prompt
export PS1="%F{cyan}%n%f at %F{magenta}%m%f in %F{blue}%1~%f 🍋 "

# Enable history
HISTFILE=~/.zsh_history
HISTSIZE=100000
