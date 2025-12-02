{ config, pkgs, ... }:

{
  imports =
    [
      ../../system/core.nix
    ];

  networking.hostName = "nixos"; 
}
