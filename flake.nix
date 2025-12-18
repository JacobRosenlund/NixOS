{
  description = "NixOS Config Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";

    darkmatter-grub-theme = {
      url = gitlab:VandalByte/darkmatter-grub-theme;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = { 
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    catppuccin.url = "github:catppuccin/nix";

    swww.url = "github:LGFae/swww";
  };

  outputs = { self, nixpkgs, darkmatter-grub-theme, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/default/configuration.nix
            darkmatter-grub-theme.nixosModule
            inputs.home-manager.nixosModules.default{
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
            inputs.stylix.nixosModules.stylix
          ];
        };
      };
    };
}
