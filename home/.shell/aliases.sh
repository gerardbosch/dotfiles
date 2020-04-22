# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias gp='grep -n --exclude-dir .svn --exclude-dir .git'
alias p='setsid audacious -e . >/dev/null'
alias P='setsid audacious . >/dev/null'
alias pt='setsid audacious -E . >/dev/null'  # play in templist
