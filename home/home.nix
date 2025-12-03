{ hyprland, pkgs, ...}: {

  imports = [
    #./environment
    ./programs
    ./scripts
    ./gnome
  ];

  home = {
    username = "joseph";
    homeDirectory = "/home/joseph";
  };

  home.packages = (with pkgs; [
    jetbrains-mono
  ]);

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}