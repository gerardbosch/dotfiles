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

# Make less more friendly for non-text input files, see lesspipe(1)
# will be able to read: tars, images, etc.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"

export LANG="en_GB.UTF-8"
export LANGUAGE="en_GB:en"
export LC_MESSAGES="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LC_COLLATE="en_GB.UTF-8"

# Common shell (bash/zsh) stuff
source ~/.shell/common-rc

# Redefine some keyboard mapping: slash / plus / dead_circumflex
if [ -x ""$(command -v xmodmap)"" ]; then
  xmodmap -e 'keycode 16 = 7 dead_circumflex slash braceleft seveneighths'
  xmodmap -e 'keycode 35 = slash asterisk plus asterisk bracketright dead_macron'
  xmodmap -e 'keycode 34 = dead_grave plus dead_grave dead_circumflex bracketleft dead_abovering'
  xmodmap -e 'keycode 47 = colon Ntilde ntilde Ntilde asciitilde dead_doubleacute'
  xmodmap -e 'keycode 60 = period ntilde period colon periodcentered division periodcentered division'
fi

# Homebrew / Linuxbrew (brew installation instructions)
case "$(uname -s)" in
  Linux*) eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv) ;;
esac

# homeshick command (from its Github installation)
source "${CASTLES}/homeshick/homeshick.sh"
homeshick --quiet refresh 1 # check outdated castles (1 day) and prompt for update

