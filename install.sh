#!/usr/bin/env bash

cd $(dirname $BASH_SOURCE)
SETUP_DIR=$(pwd)

# Symlink dotfiles.
for file in aliases bashrc dotfiles_profile exports gitconfig gitignore path \
    zlogin zshrc; do
    mkdir -pv dotfiles.old
    [ -e ~/.$file ] && mv -v ~/.$file dotfiles.old/.$file
    ln -sfv $SETUP_DIR/$file ~/.$file
done

# macOS-specific installations.
if [ $(uname -s) = 'Darwin' ]; then
    # Prevents macOS terminal from displaying last login on start.
    ln -sfv $SETUP_DIR/.hushlogin ~/.hushlogin

    # Install Homebrew if it doesn't exist.
    [ -z "$(which brew)" ] &&
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # Install Homebrew packages.
    brew install git imagemagick python python3 ruby tree zsh

    # Install vim with Python 3 flag.
    brew install vim --with-python3
fi

# Load ~/.dotfiles which loads the other dotfiles.
source ~/.dotfiles_profile

unset SETUP_DIR
