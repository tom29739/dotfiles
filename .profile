# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

eval "$(hub alias -s)"

if [ -f $HOME/hub-linux-amd64-2.2.3/etc/hub.bash_completion ]; then
    . $HOME/hub-linux-amd64-2.2.3/etc/hub.bash_completion
fi

# if [ -d "$HOME/.local/bin" ]; then
#     PATH="$PATH:$HOME/.local/bin"
# fi

# if [ -d "$HOME/powerline-status-2.3/powerline/bindings/bash/powerline.sh" ]; then
#     . $HOME/powerline-status-2.3/powerline/bindings/bash/powerline.sh
# fi

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
