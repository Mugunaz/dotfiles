{ config, pkgs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ./base.nix
    ./users.nix
    ./services.nix
  ];
}
