#
# Zsh configurations.
#
# Note: zsh automatically sources .zprofile before .zshrc.

# Configure vi mode.
bindkey -v # Use vi key bindings. Press ESC to get into command mode.
bindkey -M viins 'jk' vi-cmd-mode # Bind jk to enter command mode.
bindkey -M vicmd 'H' beginning-of-line # Bind H to go to beginning of the line.
bindkey -M vicmd 'L' end-of-line # Bind L to go to the end of the line.

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.prezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.prezto/init.zsh"
fi

# Source fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source nvm.
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && . "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && . "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

