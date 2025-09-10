{ config, lib, pkgs, inputs, ... }:

{
  environment.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    WLR_NO_HARDWARE_CURSORS = 1;
    DESKTOP = "$HOME/Desktop";
    DOCUMENTS = "$HOME/Documents";
    DOWNLOADS = "$HOME/Downloads";
    MUSIC = "$HOME/Audio";
    PICTURES = "$HOME/Pictures";
    TEMPLATES = "$HOME/Templates";
    VIDEOS = "$HOME/Videos";
    HYPRSHOT_DIR = "$HOME/Pictures";
  };
}
