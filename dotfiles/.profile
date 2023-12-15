# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
#if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

## alias gotop to track video card ##
alias gotop="gotop --nvidia"

# tunnels
alias tunnel-empire='ssh -D 34567 -N -f emp-linux'
alias tunnel-minikube='ssh -D 32123 -N -f minikube'

#source <(kubectl completion bash)

# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/lineage/bin:$PATH"
fi

export PATH=$PATH:/usr/local/go/bin

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache

alias pssh="parallel-ssh"

alias dash-token="kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d"

alias butane="docker run --rm -it --name butane --security-opt label=disable -v ${PWD}:/pwd --workdir /pwd quay.io/coreos/butane:release"
alias code="codium"
#source <(skipper completion)


export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

alias the-nvidia-thing="sudo apt-get remove --purge '^nvidia-.*' -y; sudo apt-get install ubuntu-desktop -y; sudo rm /etc/X11/xorg.conf; echo 'nouveau' | sudo tee -a /etc/modules"

alias hows-my-gpu='echo "NVIDIA Dedicated Graphics" | grep "NVIDIA" && lspci -nnk | grep "NVIDIA Corporation GA104" -A 2 | grep "Kernel driver in use" && echo "Intel Integrated Graphics" | grep "Intel" && lspci -nnk | grep "Intel.*Integrated Graphics Controller" -A 3 | grep "Kernel driver in use" && echo "Enable and disable the dedicated NVIDIA GPU with nvidia-enable and nvidia-disable"'

#alias nvidia-enable='sudo virsh nodedev-reattach pci_0000_65_00_0 && sudo virsh nodedev-reattach pci_0000_65_00_1 && echo "GPU reattached (now host ready)" && sudo rmmod vfio_pci vfio_pci_core vfio_iommu_type1 && echo "VFIO drivers removed" && sudo modprobe -i nvidia_modeset nvidia_drm nvidia && echo "NVIDIA drivers added" && echo "COMPLETED!"'

#alias nvidia-disable='sudo modprobe -i vfio_pci vfio_pci_core vfio_iommu_type1 && echo "VFIO drivers added" && sudo virsh nodedev-detach pci_0000_65_00_0 && sudo virsh nodedev-detach pci_0000_65_00_1 && echo "GPU detached (now vfio ready)" && echo "COMPLETED!"'

alias plasma-restart="kquitapp5 plasmashell; kstart5 plasmashell &"
alias plasma-kill-5="killall plasmashell; kstart5 plasmashell &"
alias plasma-kill-4="killall plasmashell; kstart plasmashell &"

alias ss="QT_QPA_PLATFORM=xcb flameshot gui --raw | wl-copy"

alias unfuck-me="sudo apt-get install --reinstall ubuntu-desktop; sudo apt-get install --reinstall kde-full"
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
#neofetch --color_blocks off
#fortune | cowthink -f tux | lolcat
