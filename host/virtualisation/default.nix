{ config, pkgs, user, ... }:

{
  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = [ "joseph" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}