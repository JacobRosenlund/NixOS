{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Essentials (Crucial or Important)
      kitty           # System terminal
      # zsh             # System Shell
      stow            # Manage dotfiles
      git             # Manage github repos
      wget            # Network retriever
      man-pages       # General manual pages
      man-pages-posix # Posix manual man-pages

    # Flavours (Make terminal tasty)
      # zoxide    # Replace `cd`
      eza       # Better `ls`
      fzf       # Fuzzy finder
      bat       # Replace `cat`
      viddy     # Better `watch` command
      lazygit   # Git manager
      fd        # Replace `find`
      starship  # Beautify terminal
      tinyxxd     # vim hex dump replacement

    # Tools (Useful terminal tools)
      tmux        # Terminal multiplexer
      bc          # Terminal calculator
      ffmpeg      # The swiss-army-knife media tool
      fastfetch   # Neofetch-like command
      btop        # Resource Monitor
      ripgrep     # `rg` Recursive `grep`
      file        # "File type" command
      which       # Location ofexecutables
      tree        # Directory tree generator
      entr        # Run commands on file change
      yazi        # Terminal file manager
      hexyl       # Hex viewer for terminal
      glow        # Terminal Markdown renderer
      miller      # CSV renderer
      yt-dlp      # Terminal YouTube toolkit
      platformio  # Embedded software toolkit
      esphome     # ESP32 HomeAssistant toolkit
      jq          # `sed` for JSON
  ];
}
