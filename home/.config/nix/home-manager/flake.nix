{
  description = "My personal Nix packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixgl.url   = "github:nix-community/nixGL";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixgl, home-manager, ... }:
    let
      system = "x86_64-linux";
      #pkgs = nixpkgs.legacyPackages.${system};
      pkgs = import nixpkgs { inherit system; };

    in {
      homeConfigurations.gerard = home-manager.lib.homeManagerConfiguration {

        inherit pkgs;

        # Specify your home configuration modules here
        modules = [
          ./home.nix
        ];

        # Pass the nixgl input to home.nix
        extraSpecialArgs = {
          nixgl = nixgl;
        };
      };
    };
}

