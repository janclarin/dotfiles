#!/usr/bin/env bash

cd $(dirname $BASH_SOURCE)
SETUP_DIR=$(pwd)

# Pull down submodules, i.e. prezto, and update them.
echo "Pull and update submodules:"
git submodule update --init --recursive

# Symlink dotfiles and prezto folder.
echo "Symlink and back up dotfiles in dotfiles.old:"
mkdir -pv dotfiles.old
for file in aliases exports path profile \
            gitconfig gitignore \
            prezto zlogin zpreztorc zprofile zshrc; do
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
    brew install fzf git imagemagick node python python3 ruby tree zsh

    # Install vim with Python 3 flag.
    brew install vim --with-python3

    # Configure Homebrew packages.
    # fzf
    /usr/local/opt/fzf/install
else
    # Install and configure fzf.
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

# Loads profile which loads other dotfiles.
source ~/.profile
