{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    rpi-imager
    rpiboot
  ];
}
