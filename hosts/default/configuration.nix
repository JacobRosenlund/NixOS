{ config, lib, pkgs, inputs, modulesPath, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/nixos/users.nix
    ./sessionVariables.nix
    ./stylix.nix
    ./system-packages.nix
    ../../modules/nixos/kanata/config.nix
    ../../modules/nixos/neovim/config.nix
    ../../modules/nixos/network/config.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/cron.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/ssh.nix
    ../../modules/nixos/syncthing.nix
    ../../modules/nixos/virtualisation.nix
    ../../modules/nixos/zoxide.nix
    ../../modules/nixos/zsh.nix
  ];

  # Boot loader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

  # Time
    # networking.timeServers = options.networking.timeServers.default ++ [ "ntp.example.com" ]; 
    # services.ntp.enable = true;
    time.timeZone = "America/Denver";
  
  # Graphics
    hardware.graphics.enable = true;  # Vulkan
    services.xserver.videoDrivers = [ "modesetting" ]; 

  # Gnome Virtual File System
    services.gvfs.enable = true;

  # Nixpkgs
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    programs.nix-ld.enable = true; # Needed for Modrinth

  # Fonts
    fonts.fontDir.enable = true;

  # Users
    users.users.jacobr = {
      isNormalUser = true;
      description = "Jacob Rosenlund";
      extraGroups = [ "wheel" "audio" "networkmanager" ];
      packages = with pkgs; [  ];
    };

    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      users.jacobr = ./home.nix;
    };

  system.stateVersion = "25.11";
}
