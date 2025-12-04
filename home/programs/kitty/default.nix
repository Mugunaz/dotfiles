{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  xdg.configFile."kitty" = {
    source = ./kitty;
    force = true;
    recursive = true;
};
}