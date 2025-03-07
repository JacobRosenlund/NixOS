{ config, pkgs, inputs, ... }:

{
  imports = 
    [
      ./../../modules/home-manager/user-packages.nix
    ];

  home.username = "jacobr";
  home.homeDirectory = "/home/jacobr";

  home.stateVersion = "24.11";

  # Allow Unfree
  nixpkgs.config.allowUnfreePredicate = _: true;

  # Bluetooth
  services.mpris-proxy.enable = true;

  # Beautify
  gtk.iconTheme = {
    package = pkgs.papirus-icon-theme;
    name = "Papirus";
  };

  fonts.fontconfig.enable = true;

  # Enable Zoxide
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file = {
  };

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

