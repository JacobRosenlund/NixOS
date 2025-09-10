{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ _1password-gui ];
}
