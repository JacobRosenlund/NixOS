{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # angryipscanner
    nmap
    lsof
    wireshark
    angryoxide
  ];
}
