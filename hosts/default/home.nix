{ config, pkgs, inputs, ... }:

{
  home.username = "jacobr";
  home.homeDirectory = "/home/jacobr";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    # System Management
    hyprlock
    hypridle
    wofi
    waybar
    hyprpaper
    hyprshot
    libnotify
    swaynotificationcenter
    nautilus

    # Fonts
    font-awesome
    nerd-fonts.symbols-only

    # Terminal
    btop

    # Password Manager
    _1password-gui

    # Browser
    brave
  ];

  nixpkgs.config.allowUnfreePredicate = _: true;

  fonts.fontconfig.enable = true;

  home.file = {
  };

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
