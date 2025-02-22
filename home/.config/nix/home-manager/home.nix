{ config, pkgs, ... }:

let
 isLinux = pkgs.stdenv.isLinux == "x86_64-linux";
 isMacOs = pkgs.stdenv.isDarwin == "x86_64-darwin";

  # Load additional packages if `local-packages.nix` exists
  localPackages =
    if builtins.pathExists ./local-packages.nix
    then import ./local-packages.nix
    else [];
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "gerard";
  home.homeDirectory = "/home/gerard";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";  # Adjust to your original home-manager

  home.packages = with pkgs; [
    # === CLI ===
    # -- Basic tools
    # nh # Nix Helper CLI
    ncdu
    mc
    duf
    eza
    bat
    diffr
    delta
    ripgrep
    ripgrep-all
    neovim
    tree
    cowsay
    jumpapp
    ksnip
    ffmpeg
    yad
    tealdeer
    gh
    #fd
    gitleaks
    pre-commit
    neovim
    chafa
    exiftool
    #xsv # deprecated replace with xan
    csvkit
    mdcat
    shellcheck
    lynx
    dos2unix
    rclone
    git-filter-repo
    yt-dlp
    mediainfo
    nodejs
    direnv
    btop
    jq

    #github:ceedubs/unison-nix#packages.x86_64-linux.ucm
    #nodePackages.localtunnel

    #docker-compose
    #yarn
    #fzf
    #pipx
    #nushell
    #scala-cli
    #vdhcoapp
    #go
    #ammonite

    # -- Other
    awscli2
    aws-sso-cli

    # === Graphical ===
    #copyq # install with yay
    #ksnip
    vscode
    blanket
    obsidian
    vlc
    slack
    #remmina
    workrave
    activitywatch

    # TODO Env specific
    # quarkus # install through sdkman?
    postman

    # TODO Must be in Linux!
    ulauncher
    emote 
    caffeine-ng
    livecaptions
    gimp

  ] ++ (if isLinux then [

    # Linux specific
    #emote

  ] else if isMacOs then [

    # Packages specific to macOS

  ] else []) ++ localPackages;


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fd = { enable = true; };

  programs.nh = {
    enable = true;
    # Optional: Set the default flake to use
    # flake = "/path/to/your/flake";
  };


}

