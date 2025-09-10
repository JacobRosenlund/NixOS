{ config, lib, pkgs, inputs, ... }:

{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "jacobr";
    dataDir = "/home/jacobr";
    configDir = "/home/jacobr/.config/syncthing";
  };
}
