{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ 1password-gui ];
}
