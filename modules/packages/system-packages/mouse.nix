{ config, lib, pkgs, inputs, ... }:

{
  hardware.openrazer.enable = true;
  environent.systemPackages = with pkgs; [ openrazer-daemon polychromatic ];
  users.user.jacobr = { extraGroups = [ "openrazer" ]; };
}
