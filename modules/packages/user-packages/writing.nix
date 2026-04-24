{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    obsidian
    libreoffice
    harper
  ];
}
