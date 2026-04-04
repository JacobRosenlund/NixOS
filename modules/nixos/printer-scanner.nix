{ config, lib, pkgs, inputs, ... }:

{
  # Printers
    services.printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
      ];
    };
    # hardware.sane.enable = true;

  users.users.jacobr.extraGroups = [ "scanner" "lp" ];
}
