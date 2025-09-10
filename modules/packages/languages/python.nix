{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    python3 
    uv      # Python package manager
    python312Packages.pycryptodome
  ];
}
