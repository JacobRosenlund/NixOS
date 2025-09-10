{ config, lib, pkgs, inputs, ... }:

{
  services.ollama = {
    enable = true;
    loadModels = [ "gemma3:1b" ];
  };
}
