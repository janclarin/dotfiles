# Dotfiles
Configuration files for git, [prezto](https://github.com/sorin-ionescu/prezto),
tmux, vim/neovim, and zsh.

## Requirements
##### Set zsh as login shell

```
chsh -s $(which zsh) $(whoami)
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
./install-vim.sh [--nvim] [--ideavim]
./install-tmux.sh
./install-casks.sh
```

- Specify the `--nvim` flag to install [Neovim](https://github.com/neovim/neovim).
- Specify the `--ideavim` flag to install vimrc for [IdeaVim](https://github.com/JetBrains/ideavim).
- Use the `vi` alias to open Neovim if it's installed. This defaults to vim.


### Installation info
- `./install.sh` installs dotfiles, prezto, vimrc & plugins, Homebrew on macOS
- `./install-vim.sh` installs vimrc & vim plugins. Neovim is an optional flag
- `./install-tmux.sh` installs tmux.conf and
    [tpm](https://github.com/tmux-plugins/tpm)
- `./install-casks.sh` installs Homebrew Cask apps on macOS

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

Sample `~/.vimrc.plugins.local` for customized or secret plugins.
Loaded with [vim-plug](https://github.com/junegunn/vim-plug).


```
" my vim plugins loaded with vim-plug
Plug 'vim-syntastic/syntastic'
```

### Other *.local files
Currently supports the following local versions of source files that are loaded
after the dotfiles version.

- `path.local`
- `exports.local`
- `aliases.local`
