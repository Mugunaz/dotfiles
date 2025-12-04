{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    swaynotificationcenter
  ];

  xdg.configFile."swaync" = {
    source = ./swaync;
    force = true;
    recursive = true;
};
}