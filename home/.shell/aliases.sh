# --- Misc ---

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# copy: use rsync (it shows a progress bar, and recursion)
alias cpv='rsync -ah --info=progress2'

## grep
alias gp='grep -n --exclude-dir .svn --exclude-dir .git'
#alias gp='grep -n --color=auto --exclude-dir=".svn" --exclude-dir=".git" --exclude-dir="target"'

alias hs='homeshick'
alias tree='tree -F --dirsfirst'
alias cls='clear'
alias print_colors_shell='for i in {0..255}; do print -Pn "%${i}F${(l:3::0:)i}%f " ${${(M)$((i%8)):#7}:+"\n"}; done'

# Audacious play
alias p='setsid audacious -e . >/dev/null'
alias P='setsid audacious . >/dev/null'
alias pt='setsid audacious -E . >/dev/null'  # play in templist

# Show mounted devices: /dev/*
#alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias mnt="mount | awk '$1 ~ /\/dev/ { print $1,$3; }' | column -t | sort"

# --- Development ---

## Git
alias cg='cd $(git rev-parse --show-toplevel)' # cd to the Git root dir
# copy-branch (cpb) Copy git branch name to clipboard alias (plattform independent)
#alias cpb='git rev-parse --abbrev-ref HEAD | clipcopy'

## jshell with vavr loaded and imports in place :) ##
alias vavr='jshell --class-path "$(coursier fetch -p io.vavr:vavr:0.10.2)" --startup ~/.jshell/vavr-imports.jsh'

## Maven
alias mcp='mvn clean package'
alias mcps='mvn clean package -DskipTests -Dcheckstyle.skip'
alias mcv='mvn clean verify'
alias mcvs='mvn clean verify -DskipTests -Dcheckstyle.skip'
alias mci='mvn clean install'
alias mcis='mvn clean install -DskipTests -Dcheckstyle.skip'

