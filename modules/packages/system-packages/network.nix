{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # angryipscanner
    nmap
    lsof
    angryoxide
  ];

  programs.wireshark.enable = true;
  users.users.jacobr.extraGroups = [ "wireshark" ];
}
