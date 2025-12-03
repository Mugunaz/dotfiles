{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ../host/default.nix
  ];

  networking.hostName = "xps"; 

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  system.stateVersion = "25.11";

  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    # powerManagement.finegrained = true;

    nvidiaSettings = true;
    open = false;
  };

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

  #Garbage colector
  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 30d";
  };

  system.autoUpgrade = {
   enable = true;
   channel = "https://nixos.org/channels/nixos-25.11";
  };
}
