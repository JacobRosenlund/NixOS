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
        "/var/lib/nginx-proxy-manager/letsencrypt/:/etc/letsencrypt"
        "/var/lib/nginx-proxy-manager/98-themepark-npm:/etc/cont-init.d/99-themepark"
      ];
    };
  };
}
