{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    nautilus
    zip
    unzip
    p7zip
  ];
}
