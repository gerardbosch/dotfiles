#
# This file is sourced by other ZSH files
#

# Prepend with the given paths
prependToFpath() {
  for compPath in $@; do
    test -d "$compPath" && fpath=("$compPath" $fpath)
  done
}

# --- Manually generated completions ------------------------------

# Custom completion dir: Completion functions manually generated
# not installed by a package manager in default locations; or symlinks to completion functions

prependToFpath "${HOME}/.zsh/zshrc.d/completion"

# --- Nix-installed packages --------------------------------------

prependToFpath \
  "${HOME}/.nix-profile/share/zsh/site-functions" \
  "${HOME}/.nix-profile/share/zsh/vendor-completions" \


# --- Homebrew-installed packages ---------------------------------

if command -v brew &>/dev/null; then
  brewPrefix="$(brew --prefix)"

  prependToFpath "${brewPrefix}/share/zsh/site-functions"

  # git-extras are Git subcommands (e.g. git count), so they need to be explicitly sourced
  #source "${brewPrefix}/opt/git-extras/share/git-extras/git-extras-completion.zsh"
  source "${HOME}/.nix-profile/share/zsh/site-functions/_git_extras"
fi

