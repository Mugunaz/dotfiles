{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprland
    waybar
    wofi
    kitty
    hyprpaper
    hypridle
    hyprlock
  ];

  # Hyprland Config
  xdg.configFile."hypr/hyprland.conf".text = ''
    # Monitor
    monitor=,preferred,auto,1

    # Binds
    $mode = ALT
    bind = SUPER,Return,exec,kitty
    bind = SUPER,D,exec,wofi --show drun
    bind = SUPER,W,killactive

    # Example window rules
    windowrule=float,wofi

    # Animation
    animations = on
    animation = windows,1,7,default

  '';

  # Waybar Config
  xdg.configFile."waybar/config".text = ''
    {
      "layer": "top",
      "position": "top",
      "modules-left": ["hyprland/workspaces"],
      "modules-center": ["clock"],
      "modules-right": ["pulseaudio", "network"]
    }
  '';
}
