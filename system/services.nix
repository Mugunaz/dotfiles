{ config, pkgs, ...}:

{
  # Docker
  virtualisation.docker = {
    enable = true;
    enableNvidia = false;
    rootless.enable = false;
  };
  users.groups.docker.members = [ "joseph" ];

  # XServer
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # -----------------
  # Hyprland Settings
  # -----------------

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Settings
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  services.libinput.enable = true;
  programs.gamemode.enable = true;

  

  # CUPS (Printing)
  services.printing.enable = true;

  # Pipewire (Sound)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is en>
    # no need to redefine it in your config for now)
    #media-session.enable = true  };
  };

  # OpenSSH
  services.openssh.enable = true;

}
