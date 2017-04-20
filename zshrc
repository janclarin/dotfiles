#
# Zsh configurations.
#
# Note: zsh automatically soruces .zprofile before .zshrc.

# Configure vi mode.
bindkey -v # Use vi key bindings. Press ESC to get into command mode.
bindkey -M viins 'jk' vi-cmd-mode # Bind jk to enter command mode.
bindkey -M vicmd 'H' beginning-of-line # Bind H to go to beginning of the line.
bindkey -M vicmd 'L' end-of-line # Bind L to go to the end of the line.

# Configure zim.
if [ -f ~/.zim/init.zsh ]; then

    # Select enabled zim modules.
    zmodules=(
        directory \
        environment \
        history \
        input \
        utility \
        meta \
        syntax-highlighting \
        history-substring-search \
        prompt \
        completion)

    # Set theme.
    zprompt_theme='pure'

    # Set the string below to the desired terminal title format string.
    # Format: 'username@host:/current/directory'
    ztermtitle='%n@%m:%~'

    # Set highlighters used with the syntax-highlighting module.
    zhighlighters=(main brackets cursor)

    # Source zim.
    source ~/.zim/init.zsh
fi

# Source fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
