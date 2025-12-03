{ config, pkgs, user, ... }:

{
  programs.hyprland.enable = true;

  # Wayland goodies
  programs.wayfire.enable = false; # optional
  hardware.opengl.enable = true;

  # fix screen sharing, electron apps, wayland portals
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}