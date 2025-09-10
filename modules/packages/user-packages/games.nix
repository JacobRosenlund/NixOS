{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    modrinth-app
    retroarch
    xclicker
  ];
}
