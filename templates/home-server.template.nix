{ config, pkgs, ... }:

{
    home.file = {

    };

    home.packages = with pkgs; [
        ## Server packages
    ];

    home.sessionVariables = {
        EDITOR = "neovim";
    };
}