{ config, lib, pkgs, nixgl, ... }:

let
  isLinux = pkgs.stdenv.isLinux == "x86_64-linux";
  isMacOs = pkgs.stdenv.isDarwin == "x86_64-darwin";

  # Load additional packages if `local-packages.nix` exists
  localPackages =
    if builtins.pathExists ./local-packages.nix
    then import ./local-packages.nix
    else [];

  # Utility function to pin a package version (tag/commit)
  # Needs the integrity hash sha256, use my `sd nix commit-hash-sha256`
  pin = tag: integritySha256: import (pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = tag;
    sha256 = integritySha256;
  }) { system = builtins.currentSystem; };

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
    git-review
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
    kmonad
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
    jwt-cli
    neofetch
    pdftk
    #warp-terminal
    waveterm

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

    #github:ceedubs/unison-nix#packages.x86_64-linux.ucm
    #nodePackages.localtunnel

    #yarn
    #pipx
    #nushell
    #scala-cli
    #vdhcoapp
    #ammonite

    # -- Other
    go   # required-by: hugo
    #jekyll # gave errors: Use `nix-shell -p bundler`

    # === Graphical ===
    activitywatch
    blanket
    copyq # install with yay => any issues?
    firefox
    jetbrains-toolbox
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
    #(config.lib.nixGL.wrap ulauncher) # problems, install with yay
    yad

    # == TODO Move to localPackages
    bruno # local git-based postman replacement
    (config.lib.nixGL.wrap calibre)
    postman
    remmina
    slack

    # == TODO Enterprise: Create a group (or similar thing) for enterprise or `enterprise-aws`, `enterprise-essential`, enterprise-foo
    #     that can be enabled somehow with a local file with the groups to enable/install =)
    #     think on which groups could exist for specific apps like aws
    awscli2
    #aws-sso-cli
    kubectl # krew plugin manager not included
    kubelogin-oidc

  ] ++ (if isLinux then [

    # Linux specific

  ] else if isMacOs then [

    # macOS specific

  ] else []) ++ localPackages;
}

