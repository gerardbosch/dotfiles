# Generic completion dir (completion functions manually generated - not installed by a package manager in default locations)
fpath=(~/.zsh/completion $fpath)

# Homeshick completion
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# ---- Completions for some of the Homebrew-installed packages ----
if command -v brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Some other Hombrew-installed package completions...

# git-extras completion
source /home/linuxbrew/.linuxbrew/opt/git-extras/share/git-extras/git-extras-completion.zsh

# -----------------------------------------------------------------

