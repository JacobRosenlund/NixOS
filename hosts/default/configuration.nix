{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Denver";

  # Enable Hyprland
  programs.hyprland.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Enable sound.
  services.pipewire = {
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  environment.sessionVariables = {
    EDITOR = "nvim";
    DESKTOP = "$HOME/Desktop";
    DOCUMENTS = "$HOME/Documents";
    DOWNLOADS = "$HOME/Downloads";
    MUSIC = "$HOME/Audio";
    PICTURES = "$HOME/Pictures";
    TEMPLATES = "$HOME/Templates";
    VIDEOS = "$HOME/Videos";
  };

  programs.fish.enable = true;

  users.users.jacobr = {
    isNormalUser = true;
    description = "Jacob Rosenlund";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [ 
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "jacobr" = import ./home.nix;
    };
  };

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
    gh
    wget
    stow
    kanata
  ];

  # services.greetd = {
  #   enable = true;
  #   settings = rec {
  #     initial_session = {
  #       command = "${pkgs.hyprland}/bin/hyprland";
  #       user = "jacobr";
  #     };
  #     default_session = initial_session;
  #   };
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # networking.firewall.enable = false;

  system.stateVersion = "24.11";

}

