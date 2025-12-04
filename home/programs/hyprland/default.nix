{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  # Enable Hyprland itself
  wayland.windowManager.hyprland = {
    enable = true;
  };

  # Install the Hyprland config directory from this repo to ~/.config/hypr
  xdg.configFile."hypr" = {
    source = ./hypr;
    force = true;
    recursive = true;
  };
}
