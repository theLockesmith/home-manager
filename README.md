# Home Manager
Programs, services, dotfiles, and configs backed up and managed with [home-manager][1]


## Glossary
[Prerequisites](#prerequisites)  
[Installation](#installation)  
[Just run it](#put-it-all-together)  


## Installation
This build would not be possible without [Nix][2].  
If using an operating system other than NixOS, install Nix.  
### Multi-user Installation:
```zsh
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

### Single-user Installation:
```zsh
curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
```

Visit the [community docs][3] for more info.

### Add the appropriate channel
Nix channels are what provide package stability. The master channel is the current stable branch.

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
Now that your channel is added, install Home Manager via Nix.
```zsh
nix-shell '<home-manager>' -A install
```

### Source Home Manager script
### ***This step is only necessary if you don't plan to let Home Manager manage your dotfiles.***
```zsh
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
```

You can also add id to your .profile to source the script each time the terminal loads:
```zsh
echo ". \"$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh\"" >> $HOME/.profile
```

### Clone the repository
Clone the repository (and all submodules) to the home-manager directory:
```zsh
mkdir -p $HOME/.config/home-manager/
git clone --recurse-submodules https://github.com/theLockesmith/home-manager.git $HOME/.config/home-manager
```

### Use Home Manager to load your home
If everything goes as planned, you can deploy your home environment by running:
```zsh
home-manager switch
```

## Install Script
This install script will automate the entire process. It uses default locations and backs up your current .bashrc and .profile.
```zsh
curl -L https://raw.githubusercontent.com/theLockesmith/home-manager/main/install | sh
```

[1]: https://github.com/nix-community/home-manager
[2]: https://nix.dev/install-nix
[3]: https://nix-community.github.io/home-manager/index.html
