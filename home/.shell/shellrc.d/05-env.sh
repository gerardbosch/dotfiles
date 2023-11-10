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
export LESSOPEN='| lessfilter-fzf %s'   # a pre-processor to increase less capabilities (shell plugin)
export CASTLES="$HOME/.homesick/repos"
export SD_ROOT="$HOME/.local/share/sd"

# === fzf ===
export FZF_PREVIEW_WINDOW='right:60%:nohidden'
export FZF_PREVIEW_ADVANCED=true

# I come up with this as GraphicsMagick installed with Nix was complaining about delegates.mgk not found and did not work.
# Brew installation works fine out of the box BTW.
# See https://superuser.com/a/452657/684037
[[ $(command -v gm) =~ '.nix' ]] &&
  export MAGICK_CONFIGURE_PATH="$(dirname $(command -v gm))/../lib/GraphicsMagick-$(gm -version | head -n1 | cut -d ' ' -f2)/config"

