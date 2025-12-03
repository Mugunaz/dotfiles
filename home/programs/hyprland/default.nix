{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
    kitty   # example terminal
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    # Optional: use Hyprland's example config as base
    settings = {
      monitor = "eDP-1,1920x1080@60,0x0,1";
      exec-once = [
        "waybar"
      ];

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Return, exec, kitty"
        "$mainMod, W, closewindow"
        "$mainMod, B, firefox"
      ];
    };
  };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
    };
  };
}
