# dotfiles

> 👨‍💻️ My macOS dotfiles - configuration for zsh, brew, git, vim & more


## Features

- zsh config (`.zshrc`)
  - Fast & minimal zsh setup without plugins for speed (apart from starship prompt)
  - Starship prompt (https://starship.rs)
  - Aliases (`.aliases` & `.aliases-local` for local untracked aliases)
- nvm (https://github.com/nvm-sh/nvm)
- vim config (`.vimrc`)
  - vim-plug (https://github.com/junegunn/vim-plug)
- git config (`.gitconfig`)
  - Global gitignore (`.gitignore`)
- Homebrew (https://brew.sh)
  - `Brewfile` for installing command line dependencies & desktop apps
- Install script for automating setup on a new machine (`install.sh`)
- Symlink management with `stow` (https://www.gnu.org/software/stow)
- Binaries
  - Raycast configuration export
  - iTerm2 settings file

## Install

```bash
# Clone the repo
git clone git@github.com:jamieweavis/dotfiles.git

# Change directory
cd dotfiles

# Install brew dependencies, install vim plugins & nvm, symlink dotfiles (could take a while)
./install.sh
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
