{ config, lib, pkgs, inputs, ... }:

{
  # environment.systemPackages = with pkgs; [ espanso ];
  services.espanso.enable = true;
}
