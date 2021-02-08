#!/usr/bin/env bash

# Bash script to bootstrap my dotfiles repository along with Homeshick (a
# dotfile manager written in bash).
#
# First installs (i.e. clones to the expected place) Homeshick. Then, homeshick
# bootstraps my dotfiles (clone and link).

CASTLES=~/.homesick/repos

git clone --depth=1 https://github.com/andsens/homeshick.git "$CASTLES/homeshick"
"$CASTLES/homeshick/bin/homeshick" clone gerardbosch/dotfiles

# Text format
ul=$(tput smul)   # underline
eul=$(tput rmul)  # end underline
echo
echo
echo '🎉 Bootstrap finished!'
echo
echo "* You can check if Zsh is installed running: ${ul}zsh --version${eul}"
echo '  If its not, you can install it with your package manager, like APT or Brew.'
echo
echo '  You may probably want to have a look at this: https://docs.brew.sh/Installation'
echo
echo "* Then, you can change the login shell to Zsh 🚀🚀: ${ul}chsh -s "'$(which zsh)'"${eul}"
echo '  Log out and log back in to enjoy ❤️  your new shell; or run zsh from within bash.'
echo
echo '* Finally, you may want to install some essentials, just run (et al.):'
echo '  ~/.homesick/repos/dotfiles/brew-install-essentials'