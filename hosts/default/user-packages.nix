{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    (modulePath + "/packages/user-packages/creative.nix")
    (modulePath + "/packages/user-packages/communication.nix")
    (modulePath + "/packages/user-packages/file-manager.nix")
    (modulePath + "/packages/user-packages/fonts.nix")
    (modulePath + "/packages/user-packages/media.nix")
    (modulePath + "/packages/user-packages/modeling.nix")
    (modulePath + "/packages/user-packages/password-manager.nix")
    (modulePath + "/packages/user-packages/window-manager.nix")
  ];
}
