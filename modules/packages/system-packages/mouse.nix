{ config, lib, pkgs, inputs, ... }:

{
  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [ openrazer-daemon polychromatic ];
  users.user.jacobr = { extraGroups = [ "openrazer" ]; };
}
