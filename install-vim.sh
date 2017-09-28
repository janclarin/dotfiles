#!/usr/bin/env bash

# Get current folder.
cd $(dirname $BASH_SOURCE)
SETUP_DIR=$(pwd)

# Back up any existing .vimrc as .vimrc.old.
mv ~/.vimrc ~/.vimrc.old 2> /dev/null

# Install vim-plug.
echo "Downloading and installing vim-plug"
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

# Create backup file directory for *.swp files. Configured in .vimrc.
mkdir -p ~/.vim/tmp

# Link the vimrc file to ~/.vimrc
ln -sf $SETUP_DIR/vimrc ~/.vimrc

# Install nvim if flagged is specified.
if [ "$1" = "--nvim" ]; then
    # macOS-specific installations.
    if [ $(uname -s) = 'Darwin' ]; then
        # Install neovim and python support dependencies.
        brew install neovim
        pip2 install --user neovim
        pip3 install --user neovim

        # Link vim configuration to neovim.
        mkdir -p ~/.config/nvim/autoload
        ln -sf $SETUP_DIR/vimrc ~/.config/nvim/init.vim
        ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/
    else
        echo "Neovim installation is currently only supported on macOS"
        echo "To install Neovim manually on other operating systems, refer to github.com/neovim/neovim/wiki/Installing-Neovim"
        echo "After installing, run the following: mkdir ~/.config; ln -s ~/.vim ~/.config/nvim; ln -s ~/.vimrc ~/.config/nvim/init.vim"
    fi
elif [ "$1" = "--ideavim" ]; then
    ln -sf $SETUP_DIR/ideavimrc ~/.ideavimrc
    echo "ideavimrc has been linked as ~/.ideavimrc and installed plugins."
fi

# Install Vim plugins.
vim +PlugInstall +qall

echo "vimrc has been linked as ~/.vimrc and installed plugins."

# Unset variables.
unset SETUP_DIR
