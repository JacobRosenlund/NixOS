{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Use systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl88xxau-aircrack
  ];

  # Time zone
  time.timeZone = "America/Denver";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # File Services
    # Syncthing goes here

    # GVfs
    services.gvfs.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Session Variables
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = 1;
    EDITOR = "nvim";
    DESKTOP = "$HOME/Desktop";
    DOCUMENTS = "$HOME/Documents";
    DOWNLOADS = "$HOME/Downloads";
    MUSIC = "$HOME/Audio";
    PICTURES = "$HOME/Pictures";
    TEMPLATES = "$HOME/Templates";
    VIDEOS = "$HOME/Videos";
  };

  # Nixpkgs
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    # System
    wl-clipboard
    kanata

    # Terminal
    kitty
    fish
    tmux
    neovim
    fzf
    eza
    viddy
    git
    lazygit
    gh
    wget
    stow
    nerdfetch
    fd
    bat

    # Podman
    dive
    podman-tui
    podman-compose
    podman-desktop
    kubectl
  ];

  # Enable Podman
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # Enable Cron Service
  services.cron = {
    enable = true;
    systemCronJobs = [
      ""
    ];
  };

  # Enable kanata
    # Enable uinput
    boot.kernelModules = [ "uinput" ];
    hardware.uinput.enable = true;
  
    # Set up udev rules for uinput
    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';
    
    # Ensure the uinput group exists
    users.groups.uinput = { };

    # Add the kanata service user to necessary groups
    systemd.services.kanata-internalKeyboard.serviceConfig = {
      SupplementaryGroups = [
        "input"
        "uinput"
      ];
    };

    services.kanata = {
      enable = true;
      keyboards = {
        internalKeyboard = {
          devices = [
            "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
          ];
          extraDefCfg = "process-unmapped-keys yes";
          config = ''
	    (defsrc
 	     esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
 	     grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
 	     tab  q    w    e    r    t    y    u    i    o    p    [    ]
 	     caps a    s    d    f    g    h    j    k    l    ;    '    ret
 	     lsft z    x    c    v    b    n    m    ,    .    /    rsft
 	     lctl lmet lalt           spc            ralt rmet rctl
 	    )

 	    (defalias
 	     cec (tap-hold 100 100 esc lctrl)
 	     sym (tap-hold 200 200 tab (layer-toggle alternate))
	     em (unicode "—")
 	    )

 	    (deflayer default
 	     esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
 	     grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
 	     @sym q    w    e    r    t    y    u    i    o    p    [    ]
 	     @cec a    s    d    f    g    h    j    k    l    ;    '    ret
 	     lsft z    x    c    v    b    n    m    ,    .    /    rsft
 	     lctl lmet lalt           spc            ralt rmet rctl
 	    )

 	    (deflayer alternate
 	     lrld f13  f14  f15  f16  f17  f18  f19  f21  f22  f23  f24  _
 	     _    kp1  kp2  kp3  kp4  kp5  kp6  kp7  kp8  kp9  kp0  @em  _    _
 	     _    _    _    _    _    _    _    _    _    _    _    _    _
 	     caps _    _    _    _    _    left down up   rght _    _    _
 	     _    _    _    _    _    _    _    _    _    _    _    _
 	     _    _    _              _              _    _    _
 	    )	    
          '';
        };
      };
    };

  # Enable Hyprland
  programs.hyprland.enable = true;

  # Enable Fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Stylix
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/helios.yaml";
  stylix.cursor = {
    package = pkgs.posy-cursors;
    name = "Posy_Cursor_Mono_Black";
  };
  # stylix.fonts = {
  #   monospace = {
  #     package = pkgs.nerd-fonts;
  #     name = "CaskaydiaCove Nerd Font Mono";
  #   };
  #   sansSerif = {
  #     package = pkgs.nerd-fonts;
  #     name = "CaskaydiaCove Nerd Font";
  #   };
  #   serif = {
  #     package = pkgs.dejavu_fonts;
  #     name = "DejaVu Serif";
  #   };
  # };
  stylix.polarity = "dark";
  stylix.image = ./backgrounds/fall-leaves.jpg;

  # Fonts
  fonts.fontDir.enable = true;

  # Make Users
  users.users.jacobr = {
    isNormalUser = true;
    description = "Jacob Rosenlund";
    extraGroups = [ "wheel" "audio" "pipewire" ];
    packages = with pkgs; [ 
    ];
  };

  # Home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "jacobr" = import ./home.nix;
    };
  };

  # Launch to Hyprland
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.hyprland}/bin/hyprland";
        user = "jacobr";
      };
      default_session = initial_session;
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  # networking.firewall.enable = false;

  system.stateVersion = "24.11";

}

