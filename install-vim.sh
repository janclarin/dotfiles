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
        pip3 install --user neovim
    else
        sudo apt-get install neovim python-neovim python3-neovim
    fi

    # Link vim configuration to neovim.
    mkdir -p ~/.config/nvim/autoload
    ln -sf $SETUP_DIR/init.vim ~/.config/nvim/init.vim

    # Link CoC configuration.
    ln -sf $SETUP_DIR/coc-settings.json ~/.config/nvim/coc-settings.json
fi
if [ "$1" = "--ideavim" ]; then
    ln -sf $SETUP_DIR/ideavimrc ~/.ideavimrc
    echo "ideavimrc has been linked as ~/.ideavimrc and installed plugins."
fi
if [ "$1" = "--vscode" ]; then
    ln -sf $SETUP_DIR/vscodevimrc ~/.vscodevimrc
    echo "vscodevimrc has been linked as ~/.vscodevimrc and installed plugins."
fi

# Install Vim plugins.
vim +PlugInstall +qall

echo "vimrc has been linked as ~/.vimrc and installed plugins."

# Unset variables.
unset SETUP_DIR
