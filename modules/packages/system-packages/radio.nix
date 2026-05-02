{ config, lib, pkgs, inputs, ... }:

{
  hardware.rtl-sdr.enable = true;
  users.users.jacobr.extraGroups = [ "plugdev" ];

  environment.systemPackages = with pkgs; [
    sdrpp
    chirp
  ];
}
