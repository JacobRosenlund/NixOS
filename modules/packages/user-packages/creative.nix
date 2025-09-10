{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    gimp
    audacity
    kdePackages.kdenlive
    obs-studio
  ];
}
