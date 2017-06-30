# Path the oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

# Start ZSH
source $ZSH/oh-my-zsh.sh

# Load theme & configuration
source "$ZSH/custom/themes/spaceship.zsh-theme"
source ~/.spaceship-cfg

# Path
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"   # MacPorts
export PATH="$HOME/.composer/vendor/bin/:$PATH"      # Composer

# Aliases
source ~/.aliases
source ~/.mxm-aliases

# Load syntax highlighting plugin
source "$HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

