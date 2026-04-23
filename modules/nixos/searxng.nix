{ config, lib, pkgs, inputs, ... }:

{
  services.searx = {
    enable = true;
    redisCreateLocally = true;
    settings.server = {
      bind_address = "::1";
      port = 2050
    };
  };
};
