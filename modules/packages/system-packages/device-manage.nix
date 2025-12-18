{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    playerctl         # Interfaces with media players
    usbutils          # Includes tools such as `lsusb`
    gparted           # Partition manager
    libinput          # Wayland input device handler
    brightnessctl     # Brightness control utility
    wl-gammarelay-rs  # Control display gamma
    lz4               # Compression algorythm for `swww`
    lm_sensors        # Hardware sensor utility
    acpi              # Batter status and ACPI info
    wirelesstools     # Tools like `iwconfig`
    # xsane             # Graphical scanning frontend for `sane`
    xorg.libX11
    xorg.libXrender
    xorg.libXtst
    xorg.libXi
    xorg.libXext
    wine
    wineWowPackages.staging
    # virtualbox
  ];
}
