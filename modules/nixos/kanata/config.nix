{ config, lib, pkgs, inputs, ... }:

{
  hardware.uinput.enable = true;
  # Set up `udev` rules for `uinput`
    boot.kernelModules = [ "uinput" ];
    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';
 
  users.groups.uinput = { }; # Ensure `uinput` group exists
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [ "input" "uinput" ];
  }; # Add kanata service user to necessary groups

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [ "/dev/input/by-path/platform-i8042-serio-0-event-kbd" ];
        extraDefCfg = "process-unmapped-keys yes";
        configFile = ./kanata.kbd;
        extraArgs = [ "--nodelay" ];
      };
    };
  };
}
