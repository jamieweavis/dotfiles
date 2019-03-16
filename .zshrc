# Load antigen
source /usr/local/share/antigen/antigen.zsh

# Highlight tab completion
zstyle ':completion:*' menu select

# Plugins
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Lazy load nvm
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

# Spaceship theme
antigen theme denysdovhan/spaceship-prompt

# Let's go
antigen apply

