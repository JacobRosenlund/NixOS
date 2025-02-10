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
    pavucontrol
    nautilus

    # Fonts
    font-awesome
    nerd-fonts.caskaydia-cove

    # Terminal
    btop
    starship

    # Password Manager
    _1password-gui

    # Browser
    brave
  ];

  # Allow Unfree
  nixpkgs.config.allowUnfreePredicate = _: true;

  programs.starship.enable = true;

  fonts.fontconfig.enable = true;

  home.file = {
  };

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
