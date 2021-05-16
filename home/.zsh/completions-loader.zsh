# Custom completion dir: Completion functions manually generated - not installed by a package manager in default locations;
# or symlinks for packages
#fpath=(~/.zsh/completion $fpath)

# Homeshick completion
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)


# ---- Completions for some of the Homebrew-installed packages ----

if command -v brew &>/dev/null; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

# Some other Hombrew-installed package completions...

# git-extras completion
fpath=($(brew --prefix)/opt/git-extras/share/git-extras/git-extras-completion.zsh $fpath)

# -----------------------------------------------------------------

