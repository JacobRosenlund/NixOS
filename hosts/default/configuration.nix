{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./sessionVariables.nix
    ./stylix.nix
    ./system-packages.nix
    ./user-packages.nix
    (modulesPath + "/nixos/kanata/config.nix")
    (modulesPath + "/nixos/neovim/config.nix")
    (modulesPath + "/nixos/network/config.nix")
    (modulesPath + "/nixos/bluetooth.nix")
    (modulesPath + "/nixos/cron.nix")
    (modulesPath + "/nixos/hyprland.nix")
    (modulesPath + "/nixos/ssh.nix")
    (modulesPath + "/nixos/syncthing.nix")
    (modulesPath + "/nixos/users.nix")
    (modulesPath + "/nixos/virtualisation.nix")
    (modulesPath + "/nixos/vpn.nix")
    (modulesPath + "/nixos/zoxide.nix")
    (modulesPath + "/nixos/zsh.nix")
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
    # programs.nix-ld.enable = true;

  # Fonts
    fonts.fontDir.enable = true;

  system.stateVersion = "25.11";
}
