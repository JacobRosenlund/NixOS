{ config, lib, pkgs, inputs, ... }:

{
  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers = {
    pihole = {
      image = "pihole/pihole:latest";
      autoStart = true;
      environment = {
        TZ = "America/Denver";
        WEBPASSWORD = "pihole";
        DNSMASQ_LISTENING = "all";
        WEB_PORT = "8081";
      };
      volumes = [
        "/var/lib/pihole/data:/etc/pihole"
        "/var/lib/pihole/dnsmasq.d:/dnsmasq.d"
      ];
      extraOptions = [ "--network=pihole-net" ];
      ports = [ "127.0.0.1:8081:80" "127.0.0.1:53:53/tcp" "127.0.0.1:53:53/udp" ];
    };
  };
}
