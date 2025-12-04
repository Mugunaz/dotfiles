{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wlogout
  ];

  xdg.configFile."wlogout" = {
    source = ./wlogout;
    force = true;
    recursive = true;
};
}