# ------------
# === PATH ===
# ------------

exportPaths=(
  "${HOME}/bin"
  "${HOME}/bin/keyboard-triggers"
  "${HOME}/.local/bin"
  "${HOME}/.local/share/coursier/bin"
  "${GEM_HOME}/bin"
)

for newPath in ${exportPaths[@]}; do
  [ -d "$newPath" ] && export PATH="${newPath}:${PATH}"
done

