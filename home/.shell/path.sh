pathsToAdd=(
  "${HOME}/.local/share/coursier/bin"
  "${HOME}/bin/keyboard-triggers"
)

for p in ${pathsToAdd[@]}; do
  [ -d "$p" ] && export PATH="${p}:${PATH}"
done

