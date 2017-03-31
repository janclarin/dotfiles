#!/usr/bin/env bash

cd $(dirname $BASH_SOURCE)
SETUP_DIR=$(pwd)

# Pull down submodules, i.e. zim, and update them.
echo "Pull and update submodules:"
git submodule update --init --recursive

# Symlink dotfiles and zim folder.
echo "Symlink and back up dotfiles:"
for file in aliases bashrc dotfiles_profile exports gitconfig gitignore path \
    zim zlogin zshrc; do
    mkdir -pv dotfiles.old
    [ -e ~/.$file ] && mv -v ~/.$file dotfiles.old/.$file
    ln -sfv $SETUP_DIR/$file ~/.$file
done
unset SETUP_DIR

# macOS-specific installations.
if [ $(uname -s) = 'Darwin' ]; then
    # Prevents macOS terminal from displaying last login on start.
    touch ~/.hushlogin

    # Install Homebrew if it doesn't exist.
    echo "Install Homebrew packages:"
    [ -z "$(which brew)" ] &&
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # Install Homebrew packages.
    brew install git imagemagick python python3 ruby tree zsh

    # Install vim with Python 3 flag.
    brew install vim --with-python3
fi

# Loads dotfiles specified in the file.
source ~/.dotfiles_profile

# Install vim configurations.
echo "Install vimrc and plugins:"
./install-vim.sh
