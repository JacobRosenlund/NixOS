{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    qimgv
    pavucontrol
    vlc
    imhex
    koreader
    libreoffice
    obsidian
  ];
}
