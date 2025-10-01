{
  description = "NixOS + Home Manager flake setup";

  inputs = {
    # Pick nixpkgs release to track
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Home Manager release that matches nixpkgs
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configuration.nix

        # Enable home-manager as a NixOS module
        home-manager.nixosModules.home-manager

        # User config
        {
          home-manager.users.fabian = import ./home.nix;
        }
      ];
    };
  };
}

