# Custom completion dir: Completion functions manually generated - not installed by a package manager in default locations;
# or symlinks for packages
fpath=(~/.zsh/completion $fpath)

# --- Nix-installed packages --------------------------------------

# Standard functions location
[[ -d "${HOME}/.nix-profile/share/zsh/site-functions" ]] &&
  fpath=("${HOME}/.nix-profile/share/zsh/site-functions" $fpath)

[[ -d "${HOME}/.nix-profile/share/zsh/vendor-completions" ]] &&
  fpath=("${HOME}/.nix-profile/share/zsh/vendor-completions" $fpath)

# ---- Completions for some of the Homebrew-installed packages ----

if command -v brew &>/dev/null; then
  # Standard functions location
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

  # Others...
  # git-extras completion
  source $(brew --prefix)/opt/git-extras/share/git-extras/git-extras-completion.zsh
fi
# -----------------------------------------------------------------

