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
    (modulePath + "/packages/system-packages/network.nix")
    (modulePath + "/packages/systemPackages/clipboard.nix")
    (modulePath + "/packages/systemPackages/device-manage.nix")
  ];

  environment.systemPackages = with pkgs; [
    gparted
    openssl
    
    libnotify               # Notification utilites
    swaynotificationcenter  # Notification style
    appimage-run            # AppImage runner
  ];
}
