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

# Same as above, just local/bin instead
 if [ -d "$HOME/local/bin" ] ; then
    PATH="$HOME/local/bin:$PATH"
fi

# alias hub to git
eval "$(hub alias -s)"

# Set hub bash completion
if [ -f $HOME/etc/hub.bash_completion ]; then
    . $HOME/etc/hub.bash_completion
fi

# Set default editor
export VISUAL=vim.basic
export EDITOR=vim.basic

# Set some aliases
alias tmux='tmux -2'

# Set virtualenvwrapper environment variables
export WORKON_HOME=$HOME/envs
export PROJECT_HOME=$HOME/python

# Set up fixssh command to fix ssh-agent forwarding
fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
}
