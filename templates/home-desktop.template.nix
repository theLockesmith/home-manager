{ config, pkgs, lib, ... }:

let
    PWAsForFirefox = import ./packages/firefoxpwa { inherit pkgs; };
in
{  
    nixpkgs = {
        config = {
            allowUnfree = true;
            allowUnfreePredicate = (_: true);
            android_sdk.accept_license = true;
            # Build packages with pulseaudio support
            pulseaudio = true;
        };
    };

    home.file = {

    };

    home.packages = with pkgs; [
        ## Desktop packages
        keepassxc
        ffmpeg-full
        glxinfo
        pavucontrol
        # Half assed fix for nextcloud: https://github.com/NixOS/nixpkgs/issues/82959#issuecomment-761541061
        # nextcloud-client
        vscodium
        weechat
        remmina
        spotify
        flameshot
        # Dropping this line until PWAsForFirefox get's squared away in Nix
        # PWAsForFirefox
        # firefox-unwrapped
        # firefoxpwa
    ];

    home.sessionVariables = {
        PULSE_SERVER = "unix:/run/user/$(id -u)/pulse/native";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia"; # Use only if you have an NVIDIA GPU
    };

    # programs.firefox = {
    #     enable = true;
    #     package = pkgs.firefox-unwrapped;
    # };

    imports = lib.concatMap import [
        #./modules
        #./programs/firefox
        #./scripts
        #./services
        #./themes
    ];
    
    # Alacritty configuration
    programs.alacritty = {
        enable = false;
        settings = {
            # Your Alacritty configuration goes here
        };
    };

}