#!/usr/bin/env zsh

# Helper functions.
_install_tiny_care_terminal() {
    npm install -g git-standup tiny-care-terminal

    local exportsLocalFile='~/.exports.local'
    if [ ! -e "$exportsLocalFile" ]; then
        touch "$exportsLocalFile"
    fi

    echo "Config for tiny-care-terminal should be set in ~/.exports.local"
    echo "For more info: github.com/notwaldorf/tiny-care-terminal"
}

# Install extra npm packages.
if (( $+commands[npm] )); then
    # tiny-care-terminal
    _install_tiny_care_terminal
fi
