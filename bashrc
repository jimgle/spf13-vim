# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PS1='$ '
# zsh
alias vim="stty stop '' -ixoff ; vim"
# `Frozing' tty, so after any command terminal settings will be restored
# ttyctl -f

# bash
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
    # osx users, use stty -g
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}
