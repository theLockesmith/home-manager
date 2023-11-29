# Home Manager
Programs, services, dotfiles, and configs backed up and managed with [home-manager][1]

[1]: https://github.com/nix-community/home-manager

## Prerequisites
This is built with [Nix][2].  
If using an operating system other than NixOS, install Nix.  
### Multi-user Installation
[documentation][3]:
```zsh
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

### Single-user Installation
[documentation][4]:
```zsh
curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
```
## Installation
Visit the [community docs][5] for more info.

### Master or unstable channel:
```zsh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

### For a specific channel:
```zsh
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update
```
***- Remember to change the release version to match your release***



[2]: https://nix.dev/install-nix
[3]: https://nixos.org/manual/nix/stable/installation/multi-user.html
[4]: https://nixos.org/manual/nix/stable/installation/single-user.html
[5]: https://nix-community.github.io/home-manager/index.html
