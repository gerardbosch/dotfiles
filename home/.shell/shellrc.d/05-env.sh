# ------------------------
# === Environment vars ===
# ------------------------

# === Freedesktop.org (XDG spec) ===
export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.local/share:"${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

export EDITOR=vim

# https://github.com/unixorn/fzf-zsh-plugin/blob/main/README.md
# Ultimately, lesspipe.sh (if present) will still honor your own lessfilter if found in your PATH, leading to the
# following execution: lessfilter-fzf > lesspipe.sh > lessfilter.
export LESSOPEN='| lessfilter-fzf %s'   # a pre-processor to increase less capabilities (shell plugin)

export PAGER=less
export CASTLES="$HOME/.homesick/repos"
export SD_ROOT="$HOME/.local/share/sd"

# === Nix
export NIXPKGS_ALLOW_UNFREE=1

# === fzf ===
export FZF_PREVIEW_WINDOW='right:60%:nohidden'
export FZF_PREVIEW_ADVANCED=true

# === Hombrew / Linuxbrew ===
export HOMEBREW_GIT_PATH=/home/gerard/.nix-profile/bin/git

# === Sonarlint ===
#  Avoid polluting homedir
export SONARLINT_USER_HOME="${XDG_CACHE_HOME}/sonarlint"

# === Ruby gems ===
export GEM_HOME="${HOME}/.local/share/gem"
export BUNDLE_USER_CACHE="${XDG_CACHE_HOME}/bundle"
export BUNDLE_USER_CONFIG="${XDG_CONFIG_HOME}/bundle/config"
export BUNDLE_USER_PLUGIN="${XDG_DATA_HOME}/bundle"

# I come up with this as GraphicsMagick installed with Nix was complaining about delegates.mgk not found and did not work.
# Brew installation works fine out of the box BTW.
# See https://superuser.com/a/452657/684037
[[ $(command -v gm) =~ '.nix' ]] &&
  export MAGICK_CONFIGURE_PATH="$(dirname $(command -v gm))/../lib/GraphicsMagick-$(gm -version | head -n1 | cut -d ' ' -f2)/config"

