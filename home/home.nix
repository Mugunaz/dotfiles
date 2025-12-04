{ hyprland, pkgs, ...}: {

  imports = [
    #./environment
    ./programs
    ./gnome
  ];

  home = {
    username = "joseph";
    homeDirectory = "/home/joseph";
  };

  home.packages = (with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    swww
    cmatrix
    spotify
  ]);

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}