{
  description = "Home Manager configuration of badmin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, flake-utils, darwin, ... }:
    let
    home-manager-badmin = path: {
        home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            users.badmin = path;
            sharedModules = [];
            extraSpecialArgs = {
                inherit inputs;
            };
        };
    };
    in
    {
      homeConfigurations = {
          # These are user@host and nix will automatically pick them up
          "badmin@mac-laptop" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-darwin;
            modules = [
                ./systems/mac-laptop/home.nix
            ];
            extraSpecialArgs = {
                inherit inputs;
            };
          };
          "badmin@mac-laptop-silicon" = home-manager.lib.homeManagerConfiguration {
                      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
                      modules = [
                          ./systems/mac-laptop-silicon/home.nix
                      ];
                      extraSpecialArgs = {
                          inherit inputs;
                      };
                    };
          "badmin@badmin-laptop" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            modules = [
                ./systems/laptop/home.nix
            ];
            extraSpecialArgs = {
                inherit inputs;
            };
          };
      };
    }
    // flake-utils.lib.eachDefaultSystem (
          system:
          let
            pkgs = nixpkgs.legacyPackages.${system};
          in
          {
            formatter = pkgs.nixfmt-rfc-style;
            devShell = pkgs.mkShell {
              packages = with pkgs; [
                nil
                alejandra
              ];
            };
          }
        );
}
