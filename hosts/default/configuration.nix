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
    # systemd.network.enable = true;
    services.avahi.enable = true;             # multicast DNS and DNS Service Discovery
    services.avahi.nssmdns4 = true;           # Name Service Switch
    # networking.firewall.enable = false;
    # networking.useDHCP = false;
    # services.twingate.enable = true;
    services.tailscale.enable = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl8852bu
  ];
  boot.kernelModules = [ "uinput" "rtl8852bu" ];

  # Time zone
    time.timeZone = "America/Denver";

  # OpenGL
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "intel" ];

  # File Services
    # Syncthing
      services.syncthing = {
        enable = true;
        user = "jacobr";
        dataDir = "/home/jacobr/";
        configDir = "/home/jacobr/.config/syncthing";
      };

    # GVfs
      services.gvfs.enable = true;

  # Session Variables
    environment.sessionVariables = {
      # System Variables
        XDG_CONFIG_HOME = "$HOME/.config";
        WLR_NO_HARDWARE_CURSORS = 1;
        EDITOR = "nvim";
        DESKTOP = "$HOME/Desktop";
        DOCUMENTS = "$HOME/Documents";
        DOWNLOADS = "$HOME/Downloads";
        MUSIC = "$HOME/Audio";
        PICTURES = "$HOME/Pictures";
        TEMPLATES = "$HOME/Templates";
        VIDEOS = "$HOME/Videos";
        HYPRSHOT_DIR = "$HOME/Pictures";

      # Ollama Variables
        OLLAMA_HOST = "127.0.0.1:33020";
    };

  # Nixpkgs
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.nix-ld.enable = true;

  # System Packages
    environment.systemPackages = with pkgs; [
      # System
        # Desktop
          inputs.swww.packages.${pkgs.system}.swww
          eww
        wl-clipboard
        cliphist
        playerctl
        kanata
        usbutils
        libinput
        gparted
        wine
        winetricks
      	openssl
        brightnessctl
        lm_sensors      # Sensor utility
        wirelesstools
        acpi
        turbovnc

      # Terminal
        fastfetch
        kitty
        zsh
        zoxide
        tmux
        neovim
        lua-language-server
        fzf
        eza
        viddy
        git
        lazygit
        gh
        wget
        stow
        fd
        bat
        gnumake
        bc
        cmake
        ninja
        jq
        ffmpeg

      # Podman
        dive
        podman-tui
        podman-compose
        podman-desktop
        kubectl
        netavark
    ];

  # Enable Steam
    programs.steam.enable = true;

  # Enable joycond
    services.joycond.enable = true;

  # Enable blueman
    # services.blueman.enable = true;

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
            extraArgs = [ "--nodelay" ];
          };
        };
      };

  # Enable Hyprland
    programs.hyprland.enable = true;

  # Enable zsh
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      interactiveShellInit = ''
        export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
      '';

      shellAliases = {
        ls = "eza --icons=always";
        la = "eza -a --icons=always";
        ntfy-rebuild = "sudo nixos-rebuild switch --flake '/etc/nixos/#default' && curl -d \"✅ Nix rebuild done\" ntfy.sh/NixOS_alerts || curl -d \"⚠️ Nix rebuild failed!\" ntfy.sh/NixOS_alerts";
        cat = "bat --color=always";
        cd = "z";
      };

      # history.size = 10000;
    };
    users.defaultUserShell = pkgs.zsh;
    programs.starship.enable = true;

  # Stylix
    stylix.enable = true;
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/helios.yaml";
    stylix.cursor = {
      package = pkgs.posy-cursors;
      name = "Posy_Cursor_Mono_Black";
      size = 24;
    };
    stylix.polarity = "dark";
    stylix.image = ./backgrounds/fall-leaves.jpg;

  # Fonts
    fonts.fontDir.enable = true;

  # Make Users
    users.users.jacobr = {
      isNormalUser = true;
      description = "Jacob Rosenlund";
      extraGroups = [ "wheel" "audio" "pipewire" "networkmanager" ];
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


  system.stateVersion = "24.11";

}

