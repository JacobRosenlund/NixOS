{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [ lua5_1 luarocks ];
}
