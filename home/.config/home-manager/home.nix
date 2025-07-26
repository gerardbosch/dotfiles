{ config, lib, pkgs, nixgl, ... }:

let
  isLinux = pkgs.stdenv.isLinux;
  isDarwin = pkgs.stdenv.isDarwin;

  # Load additional packages if `local-packages.nix` exists


localPackages =
  let
    file = ./local-packages.nix;
  in
    if builtins.pathExists file
    then (import file { inherit pkgs; })
    else [];

  # localPackages =
    # if builtins.pathExists ./local-packages.nix
    # then import ./local-packages.nix { inherit pkgs; }
    # else [];

  # trace "Local packages: ${toString localPackages}"

  # Utility function to pin a package version (tag/commit)
  # Needs the integrity hash sha256, use my `sd nix commit-hash-sha256`
  pin = tag: integritySha256: import (pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = tag;
    sha256 = integritySha256;
  }) { system = builtins.currentSystem; };


  cliPackages = with pkgs; [
    bat
    bat-extras.batdiff
    bat-extras.batgrep
    bat-extras.batman
    bat-extras.batpipe
    bat-extras.batwatch
    bat-extras.prettybat
    btop
    chafa
    cloc
    cowsay
    csvkit
    delta
    diffr
    direnv
    dos2unix
    duf
    exiftool
    eza
    fasd
    fd
    ffmpeg
    fzf
    gh
    git-extras
    git-filter-repo
    git-review
    gitFull
    gitleaks
    hugo
    #jekyll # gave errors: Use `nix-shell -p bundler`
    jq
    jumpapp
    kmonad
    lesspipe
    lynx
    mc
    mdcat
    mediainfo
    ncdu
    neofetch
    neovim
    # nh # Nix Helper CLI # Added in programs
    nodejs
    nvimpager
    pdftk
    pre-commit
    ranger
    rclone
    ripgrep
    ripgrep-all
    shellcheck
    tealdeer
    tree
    xan # Rust cli to process csv files
    #vdhcoapp
    yt-dlp

    # -- CloudFlare wrangler ---------------------------------------------------
    #(pin "wrangler@4.4.0" "sha256-+VRNw/n2jsAm90Jv9gkFBYHfj+tuEhLwW1KZx9xTfUo=").wrangler # CloudFlare workers CLI

    # pin wrangler
    # (import (pkgs.fetchFromGitHub {
    #   owner = "cloudflare";
    #   repo = "workers-sdk";
    #   rev = "wrangler@4.4.0"; # e.g. commit with wrangler 3.79.0
    #   sha256 = "sha256-+VRNw/n2jsAm90Jv9gkFBYHfj+tuEhLwW1KZx9xTfUo=";
    # }) { system = builtins.currentSystem; }).wrangler

    # (pkgs.wrangler.override {
    #   dontCheckForBrokenSymlinks = true;
    # })

    # TODO
    #wrangler

    # TODO Broken package, this is a temporary workaround until fixed
    # (pkgs.wrangler.overrideAttrs (oldAttrs: {
    #   dontCheckForBrokenSymlinks = true;
    # }))
    # --------------------------------------------------------------------------
  ];

  graphicalPackages = with pkgs; [
    activitywatch
    blanket
    caffeine-ng
    copyq
    firefox
    gimp
    #jetbrains-toolbox # 2025-07 It's failing: no xdg .desktop/launcher, no IDE updates,...
    ksnip
    obsidian
    slack
    vlc
    workrave
  ];

  devtoolsPackages = with pkgs; [
    #ammonite
    bruno # local git-based postman replacement
    jwt-cli
    #nodePackages.localtunnel
    #nushell
    #scala-cli
    #pipx
    #postman
    go   # required-by: hugo
    #github:ceedubs/unison-nix#packages.x86_64-linux.ucm
    vscode
    #warp-terminal
    waveterm
    #yarn
  ];

  enterprisePackages = with pkgs; [
    awscli2
    #aws-sso-cli
    kubectl # krew plugin manager not included
    kubelogin-oidc
    slack
  ];

  linuxPackages = with pkgs; [
    (config.lib.nixGL.wrap alacritty)
    (config.lib.nixGL.wrap calibre)
    emote
    livecaptions
    postman
    remmina
    #(config.lib.nixGL.wrap ulauncher) # problems, install with yay
    yad
  ];

  macosPackages = with pkgs; [
  ];

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

  programs.command-not-found.enable = true;

  # ----------------
  # === Packages ===
  # ----------------

  home.packages =
    cliPackages ++
    graphicalPackages ++
    devtoolsPackages ++
    # TODO Conditionally enable this based on active profiles (to be configured)
    enterprisePackages ++
    (if isLinux then linuxPackages else if isDarwin then macosPackages else []) ++
    localPackages;
}

