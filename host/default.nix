{ config, lib, pkgs, ... }:
{
  imports = [
    ./virtualisation
    ./services
    ./packages
  ];
}