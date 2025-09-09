{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [ brave tor-browser ];
}
