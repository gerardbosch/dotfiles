{
  description = "My personal Nix packages";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixGL.url   = "github:nix-community/nixGL";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixGL, home-manager, ... }:
    let
      # Define an overlay to wrap certain packages with nixGL
      nixGlOverlay = self: super: {
        alacritty = nixGL.libGLConfig.wrap super.alacritty;
        calibre   = nixGL.libGLConfig.wrap super.calibre;
      };

      system = "x86_64-linux";

      #pkgs = nixpkgs.legacyPackages.${system};
      # Import Nixpkgs with the overlay applied.
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nixGlOverlay ];
      };

    in {
      homeConfigurations.gerard = home-manager.lib.homeManagerConfiguration {

        inherit pkgs;

        # Specify your home configuration modules here
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}

