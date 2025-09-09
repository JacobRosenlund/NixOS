{ config, lib, pkgs, inputs, ... }:

{
  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8852bu ];
  boot.kernelModules = [ "rtl8852bu" ];
}
