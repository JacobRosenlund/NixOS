{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [ espanso-wayland xorg.setxkbmap ];

  users.users.jacobr.extraGroups = [ "input" ];
}
