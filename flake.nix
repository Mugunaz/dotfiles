{
  description = "My NixOS + Home Manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    agenix.url = "github:ryantm/agenix";
  };

  outputs = { self, nixpkgs, home-manager, agenix, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true; # or false, as you like
    };
  in {

    nixosConfigurations."xps" = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./nixos/configuration.nix

        home-manager.nixosModules.home-manager
        agenix.nixosModules.default

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          
          home-manager.users.joseph = import ./home/home.nix;
        }
      ];
    };
  };
}
