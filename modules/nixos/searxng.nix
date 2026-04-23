{ config, lib, pkgs, inputs, ... }:

{
  services.searx = {
    enable = true;
    redisCreateLocally = true;
    environmentFile = "/home/jacobr/.searxng.env";
    settings.server = {
      bind_address = "127.0.0.1";
      port = 2050;
    };
  };
}
