pathsToAdd=(
  "${HOME}/.local/share/coursier/bin"
)

for p in ${pathsToAdd[@]}; do
  [ -d "$p" ] && export PATH="${p}:${PATH}"
done

