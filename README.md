# dotfiles

My macOS developer config

## Install

Set up fresh macOS development environment:

```bash
git clone https://github.com/jamieweavis/dotfiles.git ~/Developer/dotfiles && ~/Developer/dotfiles/install.sh
```

Update dependencies & plugins by running the install script again:

```bash
~/Developer/dotfiles/install.sh
```

## Tips

### Use fingerprint to authorise sudo

You can use your fingerprint to authorise a `sudo` command:

1. Edit `/etc/pam.d/sudo`
2. Add the following as the first entry:
```
auth       sufficient     pam_tid.so
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
