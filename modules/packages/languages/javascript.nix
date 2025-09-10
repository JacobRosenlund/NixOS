{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    pnpm
    nodejs_24
  ];
}
