{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    zulu24
  ];
}
