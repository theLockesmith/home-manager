{ config, pkgs, ... }:

{
    home.file = {

    };

    home.packages = [
        ## Desktop packages
        pkgs.keepassxc
        pkgs.ffmpeg-full
        pkgs.glxinfo
        pkgs.pavucontrol
        # Half assed fix for nextcloud: https://github.com/NixOS/nixpkgs/issues/82959#issuecomment-761541061
        # pkgs.nextcloud-client
        pkgs.vscodium
        # Removing until I can find a solution to PWAs
        # pkgs.firefox
        pkgs.weechat-unwrapped
        pkgs.remmina
    ];

    home.sessionVariables = {
        EDITOR = "neovim";
    };
}