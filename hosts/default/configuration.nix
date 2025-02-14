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

  # Time zone
  time.timeZone = "America/Denver";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
    pulse.enable = true;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Syncthing goes here

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
    kitty
    fish
    tmux
    zsh
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
    kanata
  ];

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
    extraGroups = [ "wheel" ];
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
  # services.openssh.enable = true;

  # networking.firewall.enable = false;

  system.stateVersion = "24.11";

}

