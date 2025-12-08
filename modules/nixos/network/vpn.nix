{ config, lib, pkgs, inputs, ... }:

{
  # Tailscale
    services.tailscale.enable = true;

  # VPN Packages
    # Packages:
      # - ProtonVPN
      # - WireGuard
      # - Mullvad
    services.mullvad-vpn.enable = true;
    services.mullvad-vpn.package = pkgs.mullvad-vpn;
    # environment.systemPackages = with pkgs; [ wireguard-tools protonvpn-gui ];
}
