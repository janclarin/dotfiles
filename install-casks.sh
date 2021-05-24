#!/usr/bin/env bash

# Installs Homebrew Cask apps on macOS.

if [ ! $(uname -s) = 'Darwin' ]; then
    echo "Script can only install Homebrew Cask apps on macOS"
    exit 1;
fi

echo "Installing Homebrew Cask apps"

brew tap homebrew/cask-fonts

brew install --cask \
    1password \
    alfred \
    amethyst \
    appcleaner \
    font-jetbrains-mono \
    google-backup-and-sync \
    iina \
    imageoptim \
    keepingyouawake \
    scroll-reverser \
    spotify \
    textmate \
    transmission
