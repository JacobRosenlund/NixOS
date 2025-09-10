{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    qimgv
    pavucontrol
    vlc
    koreader
    libreoffice
    obsidian
  ];
}
