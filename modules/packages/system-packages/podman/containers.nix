{ config, lib, pkgs, inputs, ... }:

{
  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers = {
    speedtest-tracker = {
      image = "lscr.io/linuxserver/speedtest-tracker:latest";
      autoStart = true;
      ports = [ "127.0.0.1:8085:80" "0.0.0.0:8443:443" ];
      volumes = [ "/var/lib/speedtest-tracker:/config" ];
      environment = {
        PUID = "1000";
        PGID = "1000";
        APP_KEY = "base64:CnElB1TbfraB2hTFlaofnoAaFBMONsb5i1HxZKkaWSE=";
        DB_CONNECTION = "sqlite";
        TZ = "America/Denver";
        SPEEDTEST_SCHEDULE = "*/10 * * * *";
        PUBLIC_DASHBOARD = true;
      };
    };
  };
}
