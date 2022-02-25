# ------------------------
# === Environment vars ===
# ------------------------

export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.local/share:"${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"

export EDITOR=vim
export LESSOPEN='| lessfilter %s'  # pre-processor for less, lessfilter relies on lesspipe.sh as fallback
export CASTLES="$HOME/.homesick/repos"
export SD_ROOT="$HOME/.local/share/sd"

# I come up with this as GraphicsMagick installed with Nix was complaining about delegates.mgk not found and did not work.
# Brew installation works fine out of the box BTW.
# See https://superuser.com/a/452657/684037
[[ $(command -v gm) =~ ".nix" ]] &&
  export MAGICK_CONFIGURE_PATH="$(dirname $(command -v gm))/../lib/GraphicsMagick-$(gm -version | head -n1 | cut -d ' ' -f2)/config"

