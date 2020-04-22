# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022


#---- Environment vars ----
export CASTLES="$HOME/.homesick/repos"
export EDITOR=vim
#--------------------------


# if running bash
if [ -n "$BASH_VERSION" ]; then
    [ -f ~/.bashrc ] && source ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

export LANG="en_GB.UTF-8"
export LANGUAGE="en_GB:en"
export LC_MESSAGES="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LC_COLLATE="en_GB.UTF-8"

# Redefine some keyboard mapping: slash / plus / dead_circumflex
xmodmap -e 'keycode 16 = 7 dead_circumflex slash braceleft seveneighths'
xmodmap -e 'keycode 35 = slash asterisk plus asterisk bracketright dead_macron'
xmodmap -e 'keycode 34 = dead_grave plus dead_grave dead_circumflex bracketleft dead_abovering'
xmodmap -e 'keycode 47 = colon Ntilde ntilde Ntilde asciitilde dead_doubleacute'
xmodmap -e 'keycode 60 = period ntilde period colon periodcentered division periodcentered division'

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# homeshick command
source "${CASTLES}/homeshick/homeshick.sh"
