{ config, pkgs, inputs, ... }:

{
  home.username = "jacobr";
  home.homeDirectory = "/home/jacobr";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    # System Management
    wofi
    waybar
    hyprpaper
    hyprshot
    libnotify
    swaynotificationcenter
    nautilus

    # Fonts
    font-awesome
    nerd-fonts.symbols-only

    # Password Manager
    _1password-gui

    # Browser
    brave
  ];

  nixpkgs.config.allowUnfreePredicate = _: true;

  fonts.fontconfig.enable = true;

  home.file = {
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/root/etc/profile.d/hm-session-vars.sh
  #

  programs.fish.enable = true;

  home.sessionVariables = {
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
