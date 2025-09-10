{ config, lib, pkgs, inputs, ... }:

{
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    dive            # Look into docker image layers
    podman-tui      # Status of containers in terminal
    podman-compose  # Podman alternative for `docker-compose`
    kubectl         # Kubernetes CLI
    netavark        # Rust based network stack for containers
  ];
}
