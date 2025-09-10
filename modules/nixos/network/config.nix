{ config, pkgs, inputs, ... }:

{
  imports = [
    ./asus-usbax56.nix
    ./vpn.nix
  ];

  # General Network
    networking.hostName = "nixos";            # This system's hostname
    networking.networkManager.enable = true;  # System for configurng network
    services.avahi.enable = true;             # mDNS Service
    services.avahi.nssmdns4= true;            # Allows `.local` usage

  # Firewall options
    # Allowing:
    # - 8080 = Calibre
    # - 9090 = Minecraft
    # - 22 = SSH
    networking.firewall.enable = true;
    networking.firewall.allowedTCPPorts = [ 8080 9090 22 ];
    networking.firewall.allowedUDPPorts = [ 9090 ];
}
