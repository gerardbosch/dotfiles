#!/usr/bin/env bash

# Will install the following list of packages
# using Homebrew package manager:

PACKAGES="
git-extras
ripgrep
bat
eth-p/software/bat-extras
exa
cloc
"

xargs brew install <<< "$PACKAGES"
