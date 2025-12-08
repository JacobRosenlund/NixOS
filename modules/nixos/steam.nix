{ config, lib, pkgs, inputs, ... }:

{
  programs.steam.enable = true;
  # remotePlay.openFirewall = true;
  # dedicatedServer.openFirewall = true;
  # localNetworkGameTransfers.openFirewall = true;

  services.joycond.enable = true;
}
