{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    zip
    unzip
    p7zip
  ];
}
