{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    font-awesome
    nerd-fonts.caskaydia-cove
    nerd-fonts.jetbrains-mono
    noto-fonts
  ];
}
