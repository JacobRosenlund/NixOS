{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    dotnet-sdk
  ];
}

