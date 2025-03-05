{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	      config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
	        inherit system;
	        inherit pkgs;
          modules = [
            ./hosts/default/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix

            # Modules
              ./modules/nixos/enable-hardware.nix
          ];
        };
      };
  };
}

