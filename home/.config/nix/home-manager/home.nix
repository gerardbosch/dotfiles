{ config, lib, pkgs, nixgl, ... }:

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
  # ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
  # Home Manager needs a bit of information about you and the paths it should manage
  home.username = "gerard";
  home.homeDirectory = "/home/gerard";

  # This value determines the Home Manager release that your configuration is compatible
  # with. This helps avoid breakage when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See the Home Manager release
  # notes for a list of state version changes in each release.
  home.stateVersion = "24.05";  # Adjust to your original home-manager
  # ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

  # Now you can use nixgl functions, for example:
  # Configure nixGL integration for OpenGL-dependent applications.
  # nixGL.packages = nixgl.packages; # using this makes a slow build of a lot of stuff :-/ use import + inherit
  nixGL.packages = import nixgl { inherit pkgs; };
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = [ "mesa" ];

  # ---------------
  # === Modules ===
  # ---------------

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.nh = {
    enable = true;
    # Optional: Set the default flake to use
    # flake = "/path/to/your/flake";
  };

  # ----------------
  # === Packages ===
  # ----------------

  home.packages = with pkgs; [

    # === CLI ===

    # nh # Nix Helper CLI # Added in programs
    lesspipe
    nvimpager
    fasd
    fd
    fzf
    gitFull
    git-extras
    ranger
    cloc
    hugo
    ncdu
    mc
    duf
    eza
    bat
    bat-extras.batdiff
    bat-extras.batgrep
    bat-extras.batman
    bat-extras.batpipe
    bat-extras.batwatch
    bat-extras.prettybat
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
    tealdeer
    gh
    #fd # added in programs
    gitleaks
    pre-commit
    chafa
    exiftool
    csvkit
    xan # Rust cli to process csv files
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
    neofetch
    pdftk
    warp-terminal
    waveterm

    #github:ceedubs/unison-nix#packages.x86_64-linux.ucm
    #nodePackages.localtunnel

    #docker-compose
    #yarn
    #pipx
    #nushell
    #scala-cli
    #vdhcoapp
    #go
    #ammonite

    # -- Other
    #awscli2
    #aws-sso-cli

    # === Graphical ===
    activitywatch
    blanket
    copyq # install with yay => any issues?
    firefox
    ksnip
    obsidian
    vlc
    vscode
    workrave

    # == TODO Must be in Linux!
    (config.lib.nixGL.wrap alacritty)
    caffeine-ng
    emote
    gimp
    livecaptions
    yad

    # == TODO Move to localPackages
    # calibre # nixGL
    (config.lib.nixGL.wrap calibre)
    #postman
    remmina
    #slack

  ] ++ (if isLinux then [

    # Linux specific

  ] else if isMacOs then [

    # macOS specific

  ] else []) ++ localPackages;
}

