{ config, lib, pkgs, inputs, ... }:

{
  # Checklist: ([ ] = not done; [x] = done; [?] = maybe done / need more research)
    # [?] Bootloader
    # [?] Network
    #   [x] Base-config
    #   [x] Firewall Options
    #   [x] VPN Options
    #   [?] Add piHole?
    # [?] Add ntp?
    # [x] Graphics
    # [x] Syncthing
    # [x] Kanata

  imports = [
    ./hardware-configuration.nix
    ./sessionVariables.nix
    ./stylix.nix
    ./system-packages.nix
    (modulesPath + "/nixos/network/config.nix")
    (modulesPath + "/nixos/syncthing.nix")
    (modulesPath + "/nixos/cron.nix")
    (modulesPath + "/nixos/kanata/config.nix")
    (modulesPath + "/nixos/zsh.nix")
    (modulesPath + "/nixos/zoxide.nix")
    (modulesPath + "/nixos/neovim/config.nix")
    (modulesPath + "/nixos/bluetooth.nix")
    (modulesPath + "/nixos/users.nix")
    (modulesPath + "/nixos/hyprland.nix")
    (modulesPath + "/nixos/ssh.nix")
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

  # Fonts
    fonts.fontDir.enable = true;

  system.stateVersion = "25.11";
}
