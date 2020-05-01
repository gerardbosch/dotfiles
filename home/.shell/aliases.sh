# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Copy: use rsync (it shows a progress bar, and recursion)
alias cpv='rsync -ah --info=progress2'

alias gp='grep -n --exclude-dir .svn --exclude-dir .git'

# Audacious play
alias p='setsid audacious -e . >/dev/null'
alias P='setsid audacious . >/dev/null'
alias pt='setsid audacious -E . >/dev/null'  # play in templist

# Show mounted devices: /dev/*
#alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias mnt="mount | awk '$1 ~ /\/dev/ { print $1,$3; }' | column -t | sort"

# Git
alias cg='cd $(git rev-parse --show-toplevel)'

# Misc
alias hs='homeshick'
