# Dotfiles
Configuration files for git, vim, zsh, etc.

## Requirements
##### Set zsh as login shell

```
chsh -s $(which zsh)
```

## Install
##### Clone the repository
```
git clone https://github.com/janclarin/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

##### Run installation scripts
```
./install.sh
./install-vim.sh [--nvim]
```

Specify the `--nvim` flag to install [Neovim](https://github.com/neovim/neovim).
Use the `vi` alias to open Neovim if it's installed. This defaults to vim.

##### Run optimization for [zim](https://github.com/Eriner/zim)
Open a new terminal and run:

```
source ~/.zlogin
```

### Installation info
- `./install.sh` installs dotfiles, zim, vimrc & plugins, and homebrew on macOS
- `./install-vim.sh` installs just vimrc, vim plugins, and, optionally, Neovim
- `./install-tmux.sh` installs tmux.conf and [tpm](https://github.com/tmux-plugins/tpm)
- `source ~/.zlogin` applies optimizations for
  [zim](https://github.com/Eriner/zim). Only needs to be run once

## Customizations
### Git
Since `~/.gitconfig` is replaced, store your custom git configurations, e.g.
user info, in a `~/.gitconfig.local` file.

Sample `~/.gitconfig.local`

```
[user]
    name = Jan Clarin
    email = hi@janclarin.com
```

### Vim
Sample `~/.vimrc.local` is for customized vim configs.

```
" neovim local configuration
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
```

Sample `~/.vimrc.plugins.local` for customized or secret plugins. Loaded with [vim-plug](https://github.com/junegunn/vim-plug).


```
" my vim plugins loaded with vim-plug
Plug 'vim-syntastic/syntastic'
```
