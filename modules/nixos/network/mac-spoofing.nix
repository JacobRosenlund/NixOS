{ config, pkgs, inputs, ... }:

{
  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "random";
  };
}
