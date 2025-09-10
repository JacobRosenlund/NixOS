{ config, lib, pkgs, inputs, ... }:

{
  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers = {
    container-name = {
      image = "speedtest-tracker";
      autoStart = true;
      ports = [ "127.0.0.1:8085:80" "0.0.0.0:8443:443" ];
    };
  };
}
