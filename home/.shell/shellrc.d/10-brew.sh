# Homebrew / Linuxbrew (brew installation instructions)

BREW_BIN=/home/linuxbrew/.linuxbrew/bin/brew

test -f "$BREW_BIN" &&
case "$(uname -s)" in
  Linux*) eval $("$BREW_BIN" shellenv) ;;
esac
