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

    # Archives
    zip
    xz
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
    python3.pkgs.pip
    uv
    lua5_1
    luarocks
    sqlite
    pnpm
    nodejs_23
    gcc
    ripgrep
    file
    which
    tree
    entr

    # Password Manager
    _1password-gui

    # Network
    angryipscanner
    nmap
    wireshark

    # Browser
    brave

    # Image Manipulation
    gimp

    # Audio
    audacity

    # IDE
    vscode

    # Essential Apps
    vlc
    sublime
    qalculate-qt
    qimgv
    libreoffice

    # Communication
    discord
    zoom

    # Misc.
    rpi-imager
  ];

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
