{ config, lib, pkgs, inputs, ... }:

{
  hardware.rtl-sdr.enable = true;
  hardware.hackrf.enable = true;
  users.users.jacobr.extraGroups = [ "plugdev" ];
  boot.blacklistedKernelModules = [
    "dvb_usb_rtl28xxu"
    "rtl2832"
    "rtl2830"
  ];

  environment.systemPackages = with pkgs; [
    sdrpp
    chirp
    hackrf
    (gnuradio.override {
      extraPackages = with gnuradioPackages; [
        osmosdr
      ];
     })
  ];
}
