# Folder aliases
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev="cd ~/Developer"
alias icl="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"
alias dots="cd ~/Developer/dotfiles"

# Command aliases
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

# Load fnm (Fast Node Manager) for managing Node.js versions
eval "$(fnm env --use-on-cd --shell zsh)"

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

# Homebrew
export PATH="/opt/homebrew/sbin:$PATH"
eval $(/opt/homebrew/bin/brew shellenv)

# Enable cd without cd
setopt AUTO_CD

# Set default editor to neovim
export VISUAL=nvim
export EDITOR="$VISUAL"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Load VS Code's shell integration for the integrated terminal
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# Starship prompt (https://starship.rs/)
eval "$(starship init zsh)"

