{ config, pkgs, ...}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  system.stateVersion = "25.05";

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Nix Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Networking
  # networking.wireless.enable = true;  # Enables wireless support via wpa_s
  networking.networkmanager.enable = true;


  # Time and Locale
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    docker-compose
    waybar
    rofi-wayland
    kitty
    wofi
    hyprpaper
    hyprlock
    hypridle
    firefox
 ];
}
