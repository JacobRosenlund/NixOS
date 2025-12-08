{ config, lib, pkgs, inputs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      vhostUserPackages = with pkgs; [ virtiofsd ];
    };
  };

  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    iproute2
    spice-gtk
  ];
  
  # This is to enable USB passthrough
  security.wrappers.spice-client-glib-usb-acl-helper = {
    source = "${pkgs.spice-gtk}/bin/spice-client-glib-usb-acl-helper";
    setuid = true;
    owner = "root";
    group = "root";
  };

  users.users.jacobr.extraGroups = [ "libvirtd" ];
}
