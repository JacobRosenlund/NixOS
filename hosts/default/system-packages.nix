{ config, lib, pkgs, inputs, modulesPath, ... }:

{
  imports = [
    ../../modules/packages/terminal.nix
    ../../modules/packages/languages/cpp.nix
    ../../modules/packages/languages/java.nix
    ../../modules/packages/languages/javascript.nix
    ../../modules/packages/languages/lua.nix
    ../../modules/packages/languages/python.nix
    ../../modules/packages/languages/sql.nix
    ../../modules/packages/system-packages/clipboard.nix
    ../../modules/packages/system-packages/device-manage.nix
    ../../modules/packages/system-packages/file-managers.nix
    ../../modules/packages/system-packages/ide.nix
    ../../modules/packages/system-packages/network.nix
    ../../modules/packages/system-packages/radio.nix
    ../../modules/packages/system-packages/rpi.nix
    ../../modules/packages/system-packages/system-build.nix
    ../../modules/packages/system-packages/system-health.nix
    ../../modules/packages/system-packages/torrent.nix
  ];

  environment.systemPackages = with pkgs; [
    openssl
    
    libnotify               # Notification utilites
    swaynotificationcenter  # Notification style
    appimage-run            # AppImage runner
  ];
}
