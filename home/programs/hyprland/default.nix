{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
    swww    # wallpaper daemon
    kitty   # example terminal
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    # Optional: use Hyprland's example config as base
    settings = {
      monitor = "eDP-1,1920x1080@60,0x0,1";
      exec-once = [
        "waybar"
        "swww init"
        "swww img ~/wallpapers/default.jpg"
      ];
    };
  };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        "layer" = "top";
        "modules-left" = [ "hyprland/workspaces" ];
        "modules-center" = [ "clock" ];
        "modules-right" = [ "pulseaudio" "battery" "tray" ];
      };
    };
    style = ''
      * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 12px;
      }
      #clock { padding: 0 10px; }
    '';
  };
}
