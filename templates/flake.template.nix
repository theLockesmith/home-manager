{
  description = "Home Manager configuration of user_placeholder";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
        url = "github:nix-community/home-manager/release-23.11";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:

  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    stateVersion = "23.11";
    overlays = [
      
    ];

  in {
    homeConfigurations."user_placeholder" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
            ./home.nix
        ];
    };
  };
}
