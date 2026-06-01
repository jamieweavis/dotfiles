# Folders
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev="cd ~/Developer"
alias icl="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"
alias dots="cd ~/Developer/dotfiles"

# Commands
alias c="claude"
alias g="git"
alias v="nvim"
alias p="pnpm"
alias t="tmux new -A"
alias ls="eza"
alias la="eza -la"
alias cat="bat"
alias glow="glow -w 0"

# Source untracked local zsh config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Enable history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# Enable cd without cd
setopt AUTO_CD

# Enable tab completion visual selection
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# Enable case insensitive tab completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Set default editor to neovim
export VISUAL=nvim
export EDITOR="$VISUAL"

# Load homebrew
export PATH="/opt/homebrew/sbin:$PATH"
eval $(/opt/homebrew/bin/brew shellenv)

# Load fzf (fuzzy finder)
source <(fzf --zsh)

# Load fnm (fast node manager)
eval "$(fnm env --use-on-cd --shell zsh)"

# Initialize starship (prompt)
eval "$(starship init zsh)"

