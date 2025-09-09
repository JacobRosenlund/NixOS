{ config, lib, pkgs, inputs, ... }:

{
  users.users.jacobr = {
    isNormalUser = true;
    description = "Jacob Rosenlund";
    extraGroups = [ "wheel" "audio" "pipewire" "networkmanager" "vboxusers" ];
    packages = with pkgs; [  ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "jacobr" = import ./home.nix; };
  };
}
