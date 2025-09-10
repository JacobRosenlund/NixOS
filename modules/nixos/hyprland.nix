{ config, lib, pkgs, inputs, ... }:

{
  programs.hyprland.enable = true;
  
  # Launch to hyprland
    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.hyprland}/bin/hyprland";
          user = "jacobr";
        };
        default_session = initial_session;
      };
    };
}
