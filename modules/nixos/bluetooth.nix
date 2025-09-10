{ config, lib, pkgs, inputs, ...}:

{
  hardware.pulseaudio.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };
  # hardware.enableAllFirmware = true;
  services.bleuman.enable = true; # Graphical bluetooth utility
  services.mpris-proxy.enable = true; # Control media players with bt devices

  environment.systemPackages = with pkgs; [ bluez ];
}
