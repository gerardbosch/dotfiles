# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && source ~/.bashrc

# Make less more friendly for non-text input files, see lesspipe(1)
# will be able to read: tars, images, etc.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export LANG="en_GB.UTF-8"
export LANGUAGE="en_GB:en"
export LC_MESSAGES="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LC_COLLATE="en_GB.UTF-8"

# Load common shell stuff (ZSH/Bash/... ), incl. env: PATH,...
source ~/.shell/shellrc
