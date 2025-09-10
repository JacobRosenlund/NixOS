{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    ncurses6
    gdb
  ];
}
