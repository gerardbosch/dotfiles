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

  programs.fd.enable = true;

  # ----------------
  # === Packages ===
  # ----------------

  home.packages = with pkgs; [

    # === CLI ===

    # nh # Nix Helper CLI # Added in programs
    lesspipe
    nvimpager
    fasd
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
    #bat-extras.prettybat
    #bat-extras.batwatch
    #bat-extras.batpipe
    #bat-extras.batman
    #bat-extras.batgrep
    #bat-extras.batdiff
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
    neovim
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
    alacritty # nixGL
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
    caffeine-ng
    emote
    gimp
    livecaptions
    yad

    # == TODO Move to localPackages
    calibre # nixGL
    #postman
    remmina
    #slack

  ] ++ (if isLinux then [

    # Linux specific

  ] else if isMacOs then [

    # macOS specific

  ]) ++ localPackages;
}

