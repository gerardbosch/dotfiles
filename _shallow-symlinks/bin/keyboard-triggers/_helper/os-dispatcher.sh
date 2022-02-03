#!/usr/bin/env bash
#
# This file is intended to be sourced by other scripts.
#

# TODO make a function with switch/case Linux, Darwin,...
#  See if that function can obtain the calling script name
#  If so, run ./CWD/os/client-script-name, e.g. ./linux/fol, all protected by an exist file -f guard or exists and executable
#
#  Then move all dotfile-linux bin/keyboard-triggers in here ./linux and make the outer script
#  just a dispatcher, calling source os-dispatcher.sh then, just `dispatch`
#  If getting the parent script name is not possible, call as `dispatch 'script-name'` and the inner impl will dispatch accordingly
#  or do nothing/echo message in the worst case.

_getOs() {
  # TODO Check if Windows/WSL needs something specific, like uname -sr
  case "$(uname -s)" in
    Linux*)  echo "linux" ;;
    Darwin*) echo "macos" ;;
  esac
}

# Dispatch a command through the proper OS-specific script.
dispatch() {

  programName=$(basename "$0")

  cwd=$(dirname "$0")
  os=$(_getOs)

  # Dispatch passing original arguments
  ${cwd}/${os}/${programName} "$@"
}

