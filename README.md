# dotfiles

> 👨‍💻️ My macOS dotfiles - configuration for zsh, brew, git, vim & more


## Features

- zsh (`.zshrc`)
  - Starship prompt (https://starship.rs)
  - Aliases (`.aliases`)
- nvm (https://github.com/nvm-sh/nvm)
- vim (`.vimrc`)
  - vim-plug (https://github.com/junegunn/vim-plug)
- git (`.gitconfig`)
  - Global gitignore (`.gitignore`)
- Homebrew (https://brew.sh)
  - `Brewfile` for installing CLI dependencies & desktop apps
- Binaries
  - Raycast configuration export
  - iTerm2 settings file
- Symlink management with GNU Stow (https://www.gnu.org/software/stow)

## Install

```bash
cd ~

git clone git@github.com:jamieweavis/dotfiles.git
```


Install brew dependencies & casks

```bash
cd dotfiles

brew bundle
```

Symlink dotfiles to home directory with [`stow`](https://www.gnu.org/software/stow/manual/stow.html#:~:text=Then%20in%20order%20to%20determine,or%20directory%20will%20be%20ignored.)

```bash
stow . --adopt --target ~
```
