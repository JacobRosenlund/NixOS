{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    freshrss
    freshrss-extensions.youtube
    freshrss-extensions.reading-time
  ];
}
