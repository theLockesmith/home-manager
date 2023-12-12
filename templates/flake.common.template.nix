{
    description = "Secondary Home Manager modules";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        homeManagerModules = [
            (import ./home.nix {inherit pkgs;})
            (import ./home-local.nix {inherit pkgs;})
        ];
    };
}