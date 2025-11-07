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

# !DOES NOT WORK
# Export PATH to environment.d for systemd:
#
#echo "PATH=${PATH}" > "${HOME}/.config/environment.d/05-user-path.conf"

# Export/dump user PATH so that systemd units can read it with `EnvironmentFile=/path/to/file` (see user kmonad.service)
# Non-sensitivie, jut make it 0600 via umask (subshell) for /run/user hygiene-paranoia 🤣
(umask 0077 && echo "PATH=${PATH}" > "${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/user.path")

