{ config, pkgs, lib, ... }:

{
  programs.git = {
      enable = true;
      userName  = "Joseph";
      userEmail = "josephbotzung@gmail.com";
    };
}
