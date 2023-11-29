# Home Manager
Programs, services, dotfiles, and configs backed up and managed with [home-manager][1]

[1]: https://github.com/nix-community/home-manager

## Glossary
[Prerequisites](#prerequisites)  
[Installation](#installation)  


## Prerequisites
This is built with [Nix][2].  
If using an operating system other than NixOS, install Nix.  
### Multi-user Installation:
[multi-user install docs][3]
```zsh
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

### Single-user Installation:
[single-user install docs][4]
```zsh
curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
```
## Installation
Visit the [community docs][5] for more info.

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

## Source Home Manager
Source the Home Manager script:
```zsh
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
```

You can also add id to your .profile to source the script each time the terminal loads:
```zsh
echo ". \"$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh\"" >> $HOME/.profile
```

## Clone the repository
Clone the repository to the home manager directory:
```zsh
mkdir -p $HOME/.config/home-manager/
git clone https://github.com/theLockesmith/home-manager.git $HOME/.config/
```

## Use Home Manager to load your home
If everything goes as planned, you can build build your home directory out by running:
```zsh
home-manager switch
```

## Put it all together
Assuming you're working on the master branch, copy and paste this directly into the terminal to get up and running:
```zsh
curl -L https://nixos.org/nix/install | sh -s -- --daemon
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
echo ". \"$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh\"" >> $HOME/.profile
mkdir -p $HOME/.config/home-manager/
git clone https://github.com/theLockesmith/home-manager.git $HOME/.config/
home-manager switch
```


[2]: https://nix.dev/install-nix
[3]: https://nixos.org/manual/nix/stable/installation/multi-user.html
[4]: https://nixos.org/manual/nix/stable/installation/single-user.html
[5]: https://nix-community.github.io/home-manager/index.html
