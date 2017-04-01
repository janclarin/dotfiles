# Dotfiles
My configuration files for git, vim, zsh, etc.

## Usage
```
git clone https://github.com/janclarin/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh

*Change shell to zsh, might need sudo*
chsh -s =zsh

*Open new terminal*
source ~/.zlogin
```

- `./install.sh` installs dotfiles, zim, vimrc & plugins, and homebrew on macOS
- `./install-vim.sh` installs just vimrc and plugins
- `source ~/.zlogin` applies optimizations for
  [zim](https://github.com/Eriner/zim). Only needs to be run once

## Customizations
### Git
Since `~/.gitconfig` is replaced, store your custom git configurations, e.g.
user info, in a `~/.gitconfig.local` file.

```
~/.gitconfig.local

[user]
    name = Jan Clarin
    email = hi@janclarin.com
```
