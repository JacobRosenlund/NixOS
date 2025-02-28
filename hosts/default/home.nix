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
    uv
    lua5_1
    luarocks
    sqlite
    pnpm
    nodejs_23
    ripgrep
    file
    which
    tree
    entr
    yazi
      # C packages
      gcc
      pkgsCross.avr.buildPackages.gcc
      ncurses6

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
    ghidra

    # Essential Apps
    vlc
    qalculate-qt
    qimgv
    libreoffice

    # Communication
    discord
    zoom

    # Misc.
    rpi-imager

    # Text Editors
    obsidian
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
