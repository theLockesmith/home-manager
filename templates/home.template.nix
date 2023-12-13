{ config, pkgs, lib, ... }:

let
  # Desktop packages
  desktopPackages = with pkgs; [
    keepassxc
    ffmpeg-full
    glxinfo
    pavucontrol
    vscodium
    weechat
    remmina
    spotify
    flameshot
  ];

  # Condition for including the desktop packages
  # includeDesktopPackages = lib.hasAttrByPath ["environment" "variables" "DESKTOP_PACKAGES"] config;
  includeDesktopPackages = builtins.getEnv "DESKTOP_PACKAGES" == "1";

  # Server packages
  serverPackages = with pkgs; [

  ];

  # Condition for including the desktop packages
  # includeServerPackages = lib.hasAttrByPath ["environment" "variables" "SERVER_PACKAGES"] config;
  includeServerPackages = builtins.getEnv "SERVER_PACKAGES" == "1";

  # Additional packages
  additionalPackages = with pkgs; [

  ];

  # includeAdditionalPackages = includeDesktopPackages || lib.hasAttrByPath ["environment" "variables" "OPTIONAL_PACKAGES"] config;
  includeAdditionalPackages = builtins.getEnv "OPTIONAL_PACKAGES" == "1";

  # Example inclusion of individual package
  # optionalPackage1 = lib.optional (lib.hasAttrByPath ["environment" "variables" "OPTIONAL_PACKAGE_1"] config) pkgs.yourPackage;
  firefoxConfigPath = ./programs/firefox;
  #includeFirefox = lib.hasAttrByPath ["environment" "variables" "USE_FIREFOX"] config;
  includeFirefox = builtins.getEnv "INCLUDE_FIREFOX" == "1";

in
{
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" "auto-allocate-uids" "impure-derivations" ];
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
  home.stateVersion = "23.05"; # Please read the comment before changing.

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

    ".vimrc".source = ./dotfiles/.vimrc;
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
    # byobu
    neovim
    neofetch
    python3
    python311Packages.virtualenvwrapper
    ruby
    cmatrix
    nettools
    fnm
    neo-cowsay
    fortune
    lolcat
    powerline
    entr
    fontconfig
    nerd-font-patcher
    argparse
    python311Packages.fontforge
    fontforge
    glibcLocales
    pciutils
    duf
    jq

  ] ++ lib.optionals includeDesktopPackages desktopPackages
    ++ lib.optionals includeServerPackages serverPackages
    ++ lib.optionals includeAdditionalPackages additionalPackages;
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
  #  /etc/profiles/per-user/forgemaster/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "neovim";
  };

  # Allow Home Manager to manage bash
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      . ~/.extrabashrc
    '';
  };

  programs.git = {
    enable = true;
    userName = "name_placeholder";
    userEmail = "email_placeholder";
    aliases = {
      st = "status";
    };
  };

  programs.git.lfs = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  imports = lib.optional includeFirefox firefoxConfigPath;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
