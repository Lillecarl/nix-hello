{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { ... } @inputs: {
    nixosConfigurations = {
      hostname = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./nixos
        ];
      };
    };

    homeConfigurations = {
      username = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = (import inputs.nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        });

        modules = [
          ./home-manager/default.nix
        ];
      };
    };
  };
}
