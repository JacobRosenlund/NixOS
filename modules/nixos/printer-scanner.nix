{ config, lib, pkgs, inputs, ... }:

{
  # Printers
    services.printing.enable = true;
    hardware.sane.enable = true;

  users.users.jacobr.extraGroups = [ "scanner" "lp" ];
}
