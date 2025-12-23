{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ monero-gui wasabiwallet ];
}
