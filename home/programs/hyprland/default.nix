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
      monitor = "eDP-1,1920x1200@60,0x0,1";
      exec-once = [
        "waybar"
      ];

      "$mainMod" = "SUPER";

      bind = [

        # Launch apps
        "$mainMod, Return, exec, kitty"
        "$mainMod, W, killactive"
        "$mainMod, B, exec, firefox"
        "$mainMod, F, exec, nautilus"

        # Focus movement
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Workspace movement
        "$mainMod+SHIFT, left, movetoworkspace, prev"
        "$mainMod+SHIFT, right, movetoworkspace, next"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"

        # Move windows between workspaces
        "$mainMod+SHIFT, 1, movetoworkspace, 1"
        "$mainMod+SHIFT, 2, movetoworkspace, 2"
        "$mainMod+SHIFT, 3, movetoworkspace, 3"
        "$mainMod+SHIFT, 4, movetoworkspace, 4"
        "$mainMod+SHIFT, 5, movetoworkspace, 5"
        "$mainMod+SHIFT, 6, movetoworkspace, 6"
        "$mainMod+SHIFT, 7, movetoworkspace, 7"
        "$mainMod+SHIFT, 8, movetoworkspace, 8"
        "$mainMod+SHIFT, 9, movetoworkspace, 9"
      ];

      env = [
        "GTK_THEME=Adwaita:dark"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
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
