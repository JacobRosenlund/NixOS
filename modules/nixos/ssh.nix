{ config, lib, pkgs, inputs, ... }:

{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowedUsers = null;
      UseDns = true;
    };
  };
  programs.ssh.startAgent = true;
}
