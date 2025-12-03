{ config, pkgs, user, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    neovim
    firefox
    fastfetch
    vscode
    git
    python3
    tailscale
    sunshine
  ];
}
