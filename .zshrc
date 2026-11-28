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
alias t="tmux"
alias ta="tmux new -A"
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

# Add docker completions (must come before compinit)
fpath=(/Users/jamie/.docker/completions $fpath)

# Enable tab completion
autoload -Uz compinit && compinit

# Enable tab completion visual selection
zstyle ':completion:*' menu select

# Enable case insensitive tab completion
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

# Load bun (javascript runtime)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Load rustup (rust manager)
export PATH=/opt/homebrew/opt/rustup/bin:$PATH
export PATH="$(dirname $(rustup which cargo)):$PATH"

# Prompt: user@host dir branch [status]
autoload -Uz vcs_info add-zsh-hook
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %%F{yellow}%b%%f'
zstyle ':vcs_info:git:*' actionformats ' %%F{yellow}%b|%a%%f'

# Git status block matching starship's git_status defaults: one symbol per
# kind of change (no counts), in starship's order, inside bold red brackets.
#   = conflicted  $ stashed  ✘ deleted  » renamed  ! modified  + staged
#   ? untracked   then ⇡ ahead, ⇣ behind, or ⇕ diverged
# Classification follows starship's parsing of `git status --porcelain=2`.
_git_prompt_status() {
  _git_status=
  [[ -n $vcs_info_msg_0_ ]] || return 0
  local out line xy ahead=0 behind=0 s=
  local -i conflicted stashed deleted renamed modified staged untracked
  out=$(git status --porcelain=2 --branch 2>/dev/null) || return 0
  for line in ${(f)out}; do
    case $line in
      '# branch.ab '*)
        ahead=${${(s: :)line}[3]#+}
        behind=${${(s: :)line}[4]#-} ;;
      [12]' '*)
        [[ $line == 2* ]] && renamed=1
        xy=${line[3,4]}
        [[ $xy == *D* ]] && deleted=1
        [[ $xy == ?[MA] ]] && modified=1
        [[ $xy == [MAT]? ]] && staged=1 ;;
      'u '*) conflicted=1 ;;
      '? '*) untracked=1 ;;
    esac
  done
  git rev-parse --verify --quiet refs/stash >/dev/null && stashed=1

  (( conflicted )) && s+='='
  (( stashed )) && s+='$'
  (( deleted )) && s+='✘'
  (( renamed )) && s+='»'
  (( modified )) && s+='!'
  (( staged )) && s+='+'
  (( untracked )) && s+='?'
  if (( ahead && behind )); then s+='⇕'
  elif (( ahead )); then s+='⇡'
  elif (( behind )); then s+='⇣'
  fi
  [[ -n $s ]] && _git_status=" %B%F{red}[$s]%f%b"
  return 0
}

add-zsh-hook precmd vcs_info
add-zsh-hook precmd _git_prompt_status
setopt PROMPT_SUBST
PROMPT='%F{green}%n%f%F{white}@%f%F{red}%m%f %F{blue}%1~%f${vcs_info_msg_0_}${_git_status} '
