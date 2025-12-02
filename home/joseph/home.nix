{ pkgs, ... }:

{
  home.username = "joseph";
  home.homeDirectory = "/home/joseph";
  
  home.stateVersion = "25.05";

  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/packages.nix
    ../../modules/home/git.nix
    ../../modules/home/editor.nix
    ../../modules/home/hyprland.nix
 ];
}
