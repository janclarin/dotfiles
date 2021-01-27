#!/usr/bin/env bash

# Get current folder.
cd $(dirname $BASH_SOURCE)
SETUP_DIR=$(pwd)

# Back up any existing .tmux.conf as .tmux.conf.old.
mv ~/.tmux.conf ~/.tmux.conf.old 2> /dev/null

# macOS-specific installations.
if [ $(uname -s) = 'Darwin' ]; then
  brew install tmux tmuxinator reattach-to-user-namespace # tmux-yank dependency
else
  apt-get install tmux tmuxinator xsel # tmux-yank dependency
fi

# Install tpm.
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Link the tmux.conf file to ~/.tmux.conf
ln -sf $SETUP_DIR/tmux.conf ~/.tmux.conf
