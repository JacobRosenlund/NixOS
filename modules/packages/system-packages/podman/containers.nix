{ config, lib, pkgs, inputs, ... }:

{
  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers = {
    nginx-proxy-manager = {
      image = "jc21/nginx-proxy-manager:latest";
      autoStart = true;
      extraOptions = [ "--network=host" ];
      volumes = [
        "/var/lib/nginx-proxy-manager/data:/data"
        "/var/lib/nginx-proxy-manager/letsencrypt:/etc/letsencrypt"
        "/var/lib/nginx-proxy-manager/98-themepark-npm:/etc/cont-init.d/99-themepark"
      ];
    };

    speedtest-tracker = {
      image = "lscr.io/linuxserver/speedtest-tracker:latest";
      autoStart = true;
      ports = [ "127.0.0.1:8085:80" ];
      volumes = [ "/var/lib/speedtest-tracker:/config" ];
      environment = {
        PUID = "1000";
        PGID = "100";
        APP_KEY = "base64:CnElB1TbfraB2hTFlaofnoAaFBMONsb5i1HxZKkaWSE=";
        DB_CONNECTION = "sqlite";
        TZ = "America/Denver";
        SPEEDTEST_SCHEDULE = "*/10 * * * *";
        PUBLIC_DASHBOARD = "true";
      };
    };

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
