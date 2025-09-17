{ config, lib, pkgs, inputs, ... }:

{
  containers.i2pd-container = {
    autoStart = true;
    config = { ... }: {
      system.stateVersion = "25.11";

      networking.firewall.allowedTCPPorts = [ 7070 4447 4444 7656 ];
      services.i2pd.proto.sam.enable = true;

      services.i2pd = {
        enable = true;
        address = "127.0.0.1";
        proto = {
          http.enable = true;
          socksProxy.enable = true;
          httpProxy.enable = true;
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [ mullvad-browser ];
}
