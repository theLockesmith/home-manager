# Home Manager
Programs, services, dotfiles, and configs backed up and managed with [home-manager][1]


## Glossary
[Prerequisites](#prerequisites)  
[Installation](#installation)  
[Just run it](#put-it-all-together)  


## Prerequisites
This is built with [Nix][2].  
If using an operating system other than NixOS, install Nix.  
### Multi-user Installation:
```zsh
sh <(curl -L https://nixos.org/nix/install) --daemon
```

### Single-user Installation:
```zsh
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```
## Installation
Visit the [community docs][3] for more info.

### Add the appropriate channel

#### Master or unstable channel:
```zsh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

#### For a specific channel:
```zsh
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update
```
***Change the release version to match your release***

#### Install Home Manager to nix
```zsh
nix-shell '<home-manager>' -A install
```

### Source Home Manager script
```zsh
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
```

You can also add id to your .profile to source the script each time the terminal loads:
```zsh
echo ". \"$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh\"" >> $HOME/.profile
```

### Clone the repository
Clone the repository to the home manager directory:
```zsh
mkdir -p $HOME/.config/home-manager/
git clone https://github.com/theLockesmith/home-manager.git $HOME/.config/
```

### Use Home Manager to load your home
If everything goes as planned, you can build build your home directory out by running:
```zsh
home-manager switch
```

## Put it all together
to get started immediately, run the install script:
```zsh
sh <(curl -L https://raw.githubusercontent.com/theLockesmith/home-manager/main/install)
```

[1]: https://github.com/nix-community/home-manager
[2]: https://nixos.org/download.html
[3]: https://nix-community.github.io/home-manager/index.html
