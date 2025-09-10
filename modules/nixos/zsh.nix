{ config, lib, pkgs, inputs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    interactiveShellInit = ''
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
    '';

    shellAliases = {
      ls = "eza --icons=always";
      la = "eza -a --icons=always";
      ntfy-rebuild = "sudo nixos-rebuild switch --flake '/etc/nixos/#default' && curl -d \"✅ Nix rebuild done\" ntfy.sh/NixOS_alerts || curl -d \"⚠️ Nix rebuild failed!\" ntfy.sh/NixOS_alerts";
      cat = "bat --color=always";
      cd = "z";
    };
  };
  
  users.defaultUserShell = pkgs.zsh;
  programs.starship.enable;
}
