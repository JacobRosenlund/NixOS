{ config, lib, pkgs, inputs, ... }:

{
  # Tailscale
    services.tailscale.enable = true;

  # VPN Packages
    # Packages:
      # - ProtonVPN
      # - WireGuard
    environment.systemPackages = with pkgs; [ wireguard-tools protonvpn-gui ];
}
