{ config, pkgs, inputs, ... }:

{
  imports = [
    (modulePath + "/modules/packages/user-packages.nix")
  ];

  home.username = "jacobr";
  home.homeDirectory = "/home/jacobr/"

  home.stateVersion = "25.11";

  gtk.iconTheme = {
    package = pkgs.papirus-icon-theme;
    name = "Papirus";
  };

  fonts.fontconfig.enable = true;
  
  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;  # Let HM install and manage itself
}
