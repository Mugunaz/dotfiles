{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # GTK theme & icons & cursor package(s)
    adw-gtk3       # example: Libadwaita-like GTK3 theme
    papirus-icon-theme
    capitaine-cursors
    gnomeExtensions.search-light
  ];

  gtk = {
    enable = true;

    theme = {
      #name = "tokyonight-gtk-theme";      # theme name as seen by GTK
      name = "Tokyonight-Dark-xhdpi";
      package = pkgs.tokyonight-gtk-theme;
    };

    font = {
      name = "JetBrains Mono";
      size = 11;   # adjust to taste
    };

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/interface" = {
    font-name = "JetBrains Mono 11";
    document-font-name = "JetBrains Mono 11";
    monospace-font-name = "JetBrains Mono 11";
    };

  };
}
