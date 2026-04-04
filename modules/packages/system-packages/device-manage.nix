{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    playerctl         # Interfaces with media players
    usbutils          # Includes tools such as `lsusb`
    gparted           # Partition manager
    libinput          # Wayland input device handler
    brightnessctl     # Brightness control utility
    wl-gammarelay-rs  # Control display gamma
    lz4               # Compression algorythm for `awww`
    lm_sensors        # Hardware sensor utility
    acpi              # Batter status and ACPI info
    wirelesstools     # Tools like `iwconfig`
    # xsane             # Graphical scanning frontend for `sane`
    libX11
    libXrender
    libXtst
    libXi
    libXext
    wine
    wineWow64Packages.staging
    # virtualbox
  ];
}
