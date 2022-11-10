# Source aliases
[ -f ~/.aliases/aliases ] && source ~/.aliases/aliases
[ -f ~/.aliases/local ] && source ~/.aliases/local

# Colourise generic output with grc
[[ -s "`brew --prefix`/etc/grc.zsh" ]] && source "`brew --prefix`/etc/grc.zsh"

# Load nvm (this is slow!)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Homebrew sbin
export PATH="/opt/homebrew/sbin:$PATH"
