{ config, lib, pkgs, inputs, ... }:

{
  stylix = {
    enable = true;
    targets.grub.enable = false;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/helios.yaml";
    cursor = {
      package = pkgs.posy-cursors;
      name = "Posy_Cursor_Mono_Black";
      size = 24;
    };
    polarity = "dark";
    image = ./backgrounds/starryboat.jpg;
  };
}
