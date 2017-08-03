#!/usr/bin/env bash

# Get current folder.
cd $(dirname $BASH_SOURCE)
SETUP_DIR=$(pwd)

# Back up any existing .tmux.conf as .tmux.conf.old.
mv ~/.tmux.conf ~/.tmux.conf.old 2> /dev/null

# Install tpm.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Link the tmux.conf file to ~/.tmux.conf
ln -sf $SETUP_DIR/tmux.conf ~/.tmux.conf
