# ------------------------
# === Environment vars ===
# ------------------------

export EDITOR=vim
export CASTLES="$HOME/.homesick/repos"

# ------------
# === PATH ===
# ------------

exportPaths=(
  "${HOME}/bin"
  "${HOME}/bin/keyboard-triggers"
  "${HOME}/.local/bin"
  "${HOME}/.local/share/coursier/bin"
)

for newPath in ${exportPaths[@]}; do
  [ -d "$newPath" ] && export PATH="${newPath}:${PATH}"
done
