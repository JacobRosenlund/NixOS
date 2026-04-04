{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    vintagestory
    modrinth-app
    retroarch
    xclicker
  ];
}
