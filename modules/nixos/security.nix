{ config, lib, pkgs, inputs, ... }:

{
  services.gnome.gnome-keyring.enable = true;
  services.gnome.gcr-ssh-agent.enable = false;
  security.pam.services.greetd.enableGnomeKeyring = true;


  programs.seahorse.enable = true;

  environment.systemPackages = with pkgs; [
    tutanota-desktop
    libsecret
  ];

  services.dbus.enable = true;
}
