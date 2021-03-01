# Enable Powerlevel10k instant prompt feature (must be near top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source aliases
[ -f ~/.aliases/aliases ] && source ~/.aliases/aliases
[ -f ~/.aliases/local ] && source ~/.aliases/local

# Colourise output with grc
[[ -s "`brew --prefix`/etc/grc.zsh" ]] && source "`brew --prefix`/etc/grc.zsh"

# Antigen
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh # lots of goodies included with this
# antigen bundle git # testing custom git aliases
# antigen bundle command-not-found # this adds ~400ms to shell start!
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen theme romkatv/powerlevel10k
antigen apply

# Keybinds
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down

# Configuration
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=226,fg=black,bold' # 226 = Yellow
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta'

# Lazy-load nvm, node & yarn
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm zsh_completion
}

NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
NODE_GLOBALS+=(node nvm yarn)
for cmd in "${NODE_GLOBALS[@]}"; do
  eval "function ${cmd}(){ unset -f ${NODE_GLOBALS[*]}; _load_nvm; unset -f _load_nvm; ${cmd} \$@; }"
done
unset cmd NODE_GLOBALS

# Yarn globals
export PATH="$PATH:$HOME/.yarn/bin"

# Load theme configuration (must be near bottom)
[[ ! -f ~/.config/p10k/p10k.zsh ]] || source ~/.config/p10k/p10k.zsh
