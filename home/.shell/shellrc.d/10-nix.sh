#
# Source Nix package manager: https://nixos.org/manual/nix/stable/introduction.html
#

# Old Nix single-user installation
#[ -e "$HOME"/.nix-profile/etc/profile.d/nix.sh ] && . "$HOME"/.nix-profile/etc/profile.d/nix.sh # added by Nix installer

# Home Manager: https://nix-community.github.io/home-manager/index.xhtml#ch-installation
[ -e "${HOME}/.nix-profile/etc/profile.d/hm-session-vars.sh" ] && . "${HOME}/.nix-profile/etc/profile.d/hm-session-vars.sh"

