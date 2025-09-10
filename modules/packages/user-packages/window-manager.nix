{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    hypridle  # Logout after some time
    hyprlock  # Login with password
    # hyprpaper # Background (Switched to swww)
    swww      # Background
    eww       # Widgets
    waybar    # Toolbar
    wofi      # Program launcher
    hyprshot  # Scroonshot utility
  ];
}
