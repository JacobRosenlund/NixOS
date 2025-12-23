{ config, pkgs, inputs, modulesPath, ... }:

{
  imports = [
    ../../modules/packages/user-packages/creative.nix
    ../../modules/packages/user-packages/communication.nix
    ../../modules/packages/user-packages/crypto.nix
    ../../modules/packages/user-packages/fonts.nix
    ../../modules/packages/user-packages/games.nix
    ../../modules/packages/user-packages/media.nix
    ../../modules/packages/user-packages/password-manager.nix
    ../../modules/packages/user-packages/reader.nix
    ../../modules/packages/user-packages/window-manager.nix
  ];

  home.username = "jacobr";
  home.homeDirectory = "/home/jacobr";
  
  home.stateVersion = "25.11";

  gtk.iconTheme = {
    package = pkgs.papirus-icon-theme;
    name = "Papirus";
  };

  fonts.fontconfig.enable = true;
  
  home.file = {};

  home.sessionVariables = {};

  services.mpris-proxy.enable = true; # Control media players with bt devices

  xdg.desktopEntries = {
    i2p-browser = {
      name = "i2p Browser";
      genericName = "Web Browser";
      exec = "${pkgs.mullvad-browser}/bin/mullvad-browser -p i2p";
    };
  };

  programs.home-manager.enable = true;  # Let HM install and manage itself

}
