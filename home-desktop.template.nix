{ config, pkgs, ... }:

let
    common = import ./home.nix;

in
common // {
    home.file = {

    };

    home.packages = [
        ## Desktop packages
        pkgs.keepassxc
        pkgs.ffmpeg-full
        pkgs.glxinfo
        pkgs.pavucontrol
        # Half assed fix for nextcloud: https://github.com/NixOS/nixpkgs/issues/82959#issuecomment-761541061
        pkgs.nextcloud-client
        pkgs.vscodium
        pkgs.firefox
    ];

    home.sessionVariables = {
        # EDITOR = "emacs";
    };
}