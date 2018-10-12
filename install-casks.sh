#!/usr/bin/env bash

# Installs Homebrew Cask apps on macOS.

if [ ! $(uname -s) = 'Darwin' ]; then
    echo "Script can only install Homebrew Cask apps on macOS"
    exit 1;
fi

echo "Installing Homebrew Cask apps"

brew cask install \
    alfred appcleaner dash google-backup-and-sync google-chrome iina java \
    keepingyouawake mounty now spectacle spotify textmate transmission
