{ config, lib, pkgs, inputs, ... }:

{
  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl88x2bu ];
  boot.kernelModules = [ "88x2bu" ];
}
