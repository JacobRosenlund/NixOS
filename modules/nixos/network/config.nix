{ config, pkgs, inputs, ... }:

{
  imports = [
    ./asus-usbax56.nix
    ./vpn.nix
  ];

  # General Network
     networking.hostName = "nixos";            # This system's hostname
     networking.networkmanager.enable = true;  # System for configurng network
     networking.nameservers = [ "127.0.0.1" ];
     services.resolved.enable = false;
     services.avahi = {
       enable = true;        # mDNS Service
       nssmdns4 = true;      # Allows `.local` usage
       openFirewall = true;  # Opens port for mDNS
       # interfaces = [ ];
     };


  # Firewall options
     # Allowing:
     # - 80 = nginx
     # - 8580 = Calibre
     # - 9090 = Minecraft
     # - 22 = SSH
     networking.firewall.enable = true;
     networking.firewall.allowedTCPPorts = [ 53 80 8580 9090 22 ];
     networking.firewall.allowedUDPPorts = [ 53 9090 ];
}
