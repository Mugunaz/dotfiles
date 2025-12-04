{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    cava
  ];

  xdg.configFile."cava" = {
    source = ./cava;
    force = true;
    recursive = true;
};
}