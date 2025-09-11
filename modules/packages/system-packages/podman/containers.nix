{ config, lib, pkgs, inputs, ... }:

{
  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers = {
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

    nginx-proxy-manager = {
      image = "jc21/nginx-proxy-manager:latest";
      autoStart = true;
      ports = [ "80:80" "81:81" "433:433" ];
      volumes = [
        "/var/lib/nginx-proxy-manager/data:/data"
        "/var/lib/nginx-proxy-manager/letsencrypt:/etc/letsencrypt"
        "/var/lib/nginx-proxy-manager/98-themepark-npm:/etc/cont-init.d/99-themepark"
      ];
    };
  };
}
