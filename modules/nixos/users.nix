{ config, lib, pkgs, inputs, ... }:

{
  users.users.jacobr = {
    isNormalUser = true;
    description = "Jacob Rosenlund";
    extraGroups = [ "wheel" "audio" "pipewire" "networkmanager" ];
    packages = with pkgs; [  ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "jacobr" = import ./home.nix; };
  };
}
