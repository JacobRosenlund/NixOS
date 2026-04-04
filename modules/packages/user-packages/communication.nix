{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ tutanota-desktop zoom-us ];
}
