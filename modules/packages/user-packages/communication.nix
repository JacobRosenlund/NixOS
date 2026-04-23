{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [  zoom-us session-desktop ];
}
