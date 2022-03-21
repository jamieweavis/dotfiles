# Source aliases
[ -f ~/.aliases/aliases ] && source ~/.aliases/aliases
[ -f ~/.aliases/local ] && source ~/.aliases/local

# Antigen
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh # lots of goodies included with this
# antigen bundle command-not-found # This adds ~400ms to shell start!
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen theme romkatv/powerlevel10k
antigen apply

# Colourise generic output with grc
[[ -s "`brew --prefix`/etc/grc.zsh" ]] && source "`brew --prefix`/etc/grc.zsh"

# Custom keybinds
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down

# Configuration
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=226,fg=black,bold' # 226 = Yellow
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta'

# Load nvm (this is slow!)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Homebrew sbin
export PATH="/usr/local/sbin:$PATH"

# Load theme configuration (must be near bottom)
[[ ! -f ~/.config/p10k/p10k.zsh ]] || source ~/.config/p10k/p10k.zsh
