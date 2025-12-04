{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    matugen
  ];

  xdg.configFile."matugen" = {
    source = ./matugen;
    force = true;
    recursive = true;
};
}
