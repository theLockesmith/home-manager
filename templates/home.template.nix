{ config, pkgs, lib, ... }:

let
  # Desktop packages
  desktopPackages = with pkgs; [
    #keepassxc
    #vscodium
    #weechat
    #remmina
    #spotify
  ];

  # Condition for including the desktop packages
  includeDesktopPackages = builtins.getEnv "DESKTOP_PACKAGES" == "1";

  # Server packages
  serverPackages = with pkgs; [

  ];

  # Condition for including the server packages
  includeServerPackages = builtins.getEnv "SERVER_PACKAGES" == "1";

  # Additional packages
  additionalPackages = with pkgs; [

  ];

  # Environment variable to include extra optional packages
  includeAdditionalPackages = builtins.getEnv "OPTIONAL_PACKAGES" == "1";

  # Optional inclusion of Firefox based on environment variable
  firefoxConfigPath = ./programs/firefox;
  includeFirefox = builtins.getEnv "INCLUDE_FIREFOX" == "1";

  # Exodus wallet
  exodusPkg = with pkgs; [exodus];
  includeExodus = builtins.getEnv "INCLUDE_EXODUS" == "1";

in
{
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" "auto-allocate-uids" "impure-derivations" ];
    # hardware.opengl.enable = true;
    # hardware.opengl.driSupport = true;
  };

  nixpkgs = {
    config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
        # Build packages with pulseaudio support
        pulseaudio = true;
    };
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "user_placeholder";
  home.homeDirectory = "home_placeholder";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.enableNixpkgsReleaseCheck = false; # Hopefully fixing a bug with random version mismatch

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    #".vimrc".source = ./dotfiles/.vimrc;
    ".config/nvim".source = ./dotfiles/kickstart.nvim;
    ".extrabashrc".source = ./dotfiles/.bashrc;
    ".localprofile" = {
      text = builtins.readFile (if builtins.pathExists ./dotfiles/.profile then ./dotfiles/.profile else ./dotfiles/blankfile);
    };
    ".zshrc".source = ./dotfiles/.zshrc;
    # ".byobu".source = ./.byobu;
    ".vim".source = ./.vim;
    ".scripts".source = ./.scripts;
    ".tmux.conf".source = ./.tmux/.tmux.conf;
    ".tmux.conf.local".source = ./dotfiles/.tmux.conf.local;
    ".config/neofetch/config.conf".source = ./dotfiles/.neofetchrc;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    htop
    gotop
    btop
    gtop
    tmux
    screen
    neofetch
    cmatrix
    neo-cowsay
    fortune
    lolcat
    powerline
    entr
    fontconfig
    nerd-font-patcher
    fontforge
    glibcLocales
    duf
    jq

  ] ++ lib.optionals includeDesktopPackages desktopPackages
    ++ lib.optionals includeServerPackages serverPackages
    ++ lib.optionals includeAdditionalPackages additionalPackages
    ++ lib.optionals includeExodus exodusPkg;
    # For individual optional packages, just use `++ pkgname` as shown below
    # ++ optionalPackage1

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/user/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Allow Home Manager to manage bash
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      . ~/.extrabashrc
    '';
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "adapta";
    };
  };

  programs.git = {
    enable = true;
    userName = "name_placeholder";
    userEmail = "email_placeholder";
    aliases = {
      st = "status";
    };
    extraConfig.submodule.recurse = true;
  };

  programs.git.lfs = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    #extraConfig = ''
    #  " Set the filetype plugin on
    #  filetype plugin on
    #
    #  " Enable syntax highlighting
    #  syntax on
    #
    #  " Set tabs to have 4 spaces
    #  set tabstop=4
    #  set shiftwidth=4
    #  set expandtab
    #
    #  " Set the clipboard to use the system clipboard
    #  set clipboard+=unnamedplus
    #'';
    #
    #plugins = with pkgs.vimPlugins; [
    #  vim-airline
    #  nerdtree
    #  diffview
    #  neogit
    #  telescope
    #];
  };

  # Optional import for Firefox
  imports = lib.optional includeFirefox firefoxConfigPath;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
