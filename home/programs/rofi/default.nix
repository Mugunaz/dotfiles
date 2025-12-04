{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi
  ];

  xdg.configFile."rofi" = {
    source = ./rofi;
    force = true;
    recursive = true;
};
}