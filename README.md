# Home Manager
Programs, services, dotfiles, and configs backed up and managed with [home-manager][1]

[1]https://github.com/nix-community/home-manager

## Prerequisites
This is built with [Nix][2]. If using an operating system other than NixOS, install Nix.
Using the [multi-user installation][3]:
```zsh
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

Or use the [single-user installation][4]:
```zsh
curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
```

[2]https://nix.dev/install-nix
[3]https://nixos.org/manual/nix/stable/installation/multi-user.html
[4]https://nixos.org/manual/nix/stable/installation/single-user.html
