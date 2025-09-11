{ config, pkgs, inputs, ... }:

{
  imports = [
    ./asus-usbax56.nix
    ./vpn.nix
  ];

  # General Network
    networking.hostName = "nixos";            # This system's hostname
    networking.networkmanager.enable = true;  # System for configurng network
    services.avahi = {
      enable = true;        # mDNS Service
      nssmdns4 = true;      # Allows `.local` usage
      openFirewall = true;  # Opens port for mDNS
    };


  # Firewall options
    # Allowing:
    # - 80 = nginx
    # - 8080 = Calibre
    # - 9090 = Minecraft
    # - 22 = SSH
    networking.firewall.enable = true;
    networking.firewall.allowedTCPPorts = [ 80 8080 9090 22 ];
    networking.firewall.allowedUDPPorts = [ 9090 ];
}
