{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    (modulePath + "/packages/terminal.nix")
    (modulePath + "/packages/languages/cpp.nix")
    (modulePath + "/packages/languages/java.nix")
    (modulePath + "/packages/languages/javascript.nix")
    (modulePath + "/packages/languages/lua.nix")
    (modulePath + "/packages/languages/python.nix")
    (modulePath + "/packages/languages/sql.nix")
    (modulePath + "/packages/systemPackages/clipboard.nix")
    (modulePath + "/packages/system-packages/device-manage.nix")
    (modulePath + "/packages/system-packages/file-managers.nix")
    (modulePath + "/packages/system-packages/ide.nix")
    (modulePath + "/packages/system-packages/network.nix")
    (modulePath + "/packages/system-packages/radio.nix")
    (modulePath + "/packages/system-packages/rpi.nix")
    (modulePath + "/packages/system-packages/system-build.nix")
    (modulePath + "/packages/system-packages/system-health.nix")
    (modulePath + "/packages/system-packages/torrent.nix")
  ];

  environment.systemPackages = with pkgs; [
    openssl
    
    libnotify               # Notification utilites
    swaynotificationcenter  # Notification style
    appimage-run            # AppImage runner
  ];
}
