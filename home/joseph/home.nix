{ pkgs, ... }:

{
  home.username = "joseph";
  home.homeDirectory = "/home/joseph";
  
  home.stateVersion = "25.05";

  imports = [
    ../../modules/home/shell.nix
  ];

  home.packages = with pkgs; [
    htop
    neovim
  ];
}
