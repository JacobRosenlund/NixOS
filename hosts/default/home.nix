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
    appimage-run
    unzip
    p7zip

    # Fonts
    font-awesome
    nerd-fonts.caskaydia-cove
    noto-fonts

    # Terminal
    btop
    starship
    python3
    sqlite
    pnpm
    nodejs_23
    gcc

    # Password Manager
    _1password-gui

    # Browser
    brave

    # Image Manipulation
    gimp
    vlc

    # Audio
    audacity

    # IDE
    vscode

    # Communication
    discord
  ];

  # Allow Unfree
  nixpkgs.config.allowUnfreePredicate = _: true;

  programs.starship.enable = true;

  fonts.fontconfig.enable = true;

  # Cursors
  # stylix.cursor = {
  #   name = "Posy_Cursor_Mono_Black";
  #   package = pkgs.posy-cursors;
  #   size = 32;
  # };

  home.file = {
  };

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
