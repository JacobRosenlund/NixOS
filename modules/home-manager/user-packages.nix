{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # System Management
      # System packages
        libnotify               # Notification utilities
        swaynotificationcenter  # Notification style
        appimage-run            # AppImage runner program

      # File Managers
        nautilus  # File Manager
        # Archives
          zip
          xz
          unzip
          p7zip
      
      # Window Manager
        hypridle    # Logout after some time 
        hyprlock    # Login with password
        hyprpaper   # Background
        waybar      # Toolbar
        wofi        # Program launcer
        hyprshot    # Screenshot utilit
	# Fonts
	  font-awesome
	  nerd-fonts.caskaydia-cove
	  noto-fonts

    # Terminal
      btop      # Resource Monitor
      starship  # Beautify terminal
      ripgrep   # (rg) Recursive Grep
      file      # "Fyle type" command
      which     # Location of executables
      tree      # Directory tree generator
      entr      # Run commands on file change
      yazi      # Terminal file Manager
      # C packages
        gcc
        pkgsCross.avr.buildPackages.gcc
        ncurses6
      # Languages
        python3
        uv      # Python package manager
        lua5_1
        luarocks
        sqlite
        pnpm
        nodejs_23
    
    # Password Manager
      _1password-gui

    # Netowork
      angryipscanner  # ip scanner
      nmap            # Network mapper
      wireshark       # Network packet sniffer
      rustdesk        # Remote Desktop

    # Browser
      brave

    # Media
      # Image Packages
        gimp  # Image manipulation
        qimgv # Image viewer
      # Audio
        pavucontrol # Audio controller
        audacity    # Audio editor
      # Video
        vlc # Media viewer

    # Tools
      qalculate-qt  # Calculator
      libreoffice   # FOSS office suite
      ollama

    # Communication
      discord
      zoom-us

    # IDE
      vscode
      ida-free

    # Text editor
      obsidian

    # Misc.
      rpi-imager
  ];
}

