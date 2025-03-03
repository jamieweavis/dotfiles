# dotfiles

> 👨‍💻️ My macOS dotfiles - configuration for zsh, aliases, brew, git & vim

## Installation

Clone repository into home directory
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
