{ config, lib, pkgs, inputs, ... }:

{
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/helios.yaml";
  stylix.cursor = {
    package = pkgs.posy-cursors;
    name = "Posy_Cursor_Mono_Black";
    size = 24;
  };
  stylix.polarity = "dark";
  stylix.image = ./backgrounds/starryboat.jpg;
}
