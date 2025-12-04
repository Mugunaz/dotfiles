{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
  ];

  xdg.configFile."waybar" = {
    source = ./waybar;
    force = true;
    recursive = true;
};
}