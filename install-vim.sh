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

# Install Vim plugins.
vim +PlugInstall +qall

echo "vimrc has been linked as ~/.vimrc and installed plugins."

# Unset variables.
unset SETUP_DIR
