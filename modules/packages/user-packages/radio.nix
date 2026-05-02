{ config, lib, pkgs, inputs, ... }:

{
  hardware.rtl-sdr.enable = true;
  users.users.jacobr.extraGroups = [ "plugdev" ];

  home.packages = with.pkgs; [ sdrpp ];
}
