let
    # Import base config
    common = import ./home.nix;

in
common // {
    home.file = common.home.files ++ {

    };

    home.packages = common.home.packages ++ [
        ## Desktop packages
        common.pkgs.keepassxc
        common.pkgs.ffmpeg-full
        common.pkgs.glxinfo
        common.pkgs.pavucontrol
        # Half assed fix for nextcloud: https://github.com/NixOS/nixpkgs/issues/82959#issuecomment-761541061
        # pkgs.nextcloud-client
        common.pkgs.vscodium
        common.pkgs.firefox
    ];

    home.sessionVariables = common.home.sessionVariables ++ {
        # EDITOR = "emacs";
    };
}