{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [ lua-language-server lua5_1 luarocks ];
}
