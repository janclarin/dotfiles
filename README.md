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
