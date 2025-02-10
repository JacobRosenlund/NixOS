{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };

  # outputs = { nixpkgs, ... }@inputs: let
  #   system = "x86_64-linux";
  #   pkgs = nixpkgs.legacyPackages.${system};
  # in {
  #   homeConfigurations."jacobr" = home-manager.lib.homeManagerConfiguration {
  #     inherit pkgs;
  #     modules = [
  #       ./home.nix
  #       ./modules/home-manager
  #     ];
  #   };
  # };
}
