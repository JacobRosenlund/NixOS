{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [ espanso-wayland setxkbmap ];

  users.users.jacobr.extraGroups = [ "input" ];
}
