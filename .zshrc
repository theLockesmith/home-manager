# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#
# Default
#
# ZSH_THEME="robbyrussell"
#
# We don't stand for default!
#
ZSH_THEME="forgemaster"
#ZSH_THEME="agnoster"

########################
## Virtualenv loading ##
########################

## PYTHON ##
export PYTHONPATH=$PYTHONPATH:"/usr/bin/python3"
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/projects
if [[ $EUID != 0 ]]; then
  if [[ -d "$HOME/.local" ]]; then
    if [[ -f "$HOME/.local/bin/virtualenvwrapper.sh" ]]; then
      source $HOME/.local/bin/virtualenvwrapper.sh
    fi
  fi
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  virtualenvwrapper  
)

source $ZSH/oh-my-zsh.sh

# User configuration

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
# shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=100000

## RVM is a bit of a pain... Save this variable later so it can be prepended to PATH ##
GEM_HOME_OLD=""
[[ "$GEM_HOME" ]] && GEM_HOME_OLD="$GEM_HOME/bin"
## Need to hold Python virtual env for it to be appended somewhere after RVM path ##
VIRTUAL_ENV_OLD=""
[[ "$VIRTUAL_ENV" ]] && VIRTUAL_ENV_OLD="$VIRTUAL_ENV/bin"

## Reset path because that can get ugly ##
#PATH=$(getconf PATH)

## Load scripts ##
export PATH="$PATH:$HOME/.scripts:$HOME/.localscripts"

## Load /snap/bin ##
export PATH="$PATH:/usr/sbin:/snap/bin:/sbin/:/usr/local/bin/:/usr/local/sbin/:$HOME/local/bin"

## Load /usr/share for LaTeX ##
export PATH="$PATH:/usr/share/texlive"

# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  if [[ $(echo "$OS") == "Darwin" ]]; then
    alias ls='ls -G'
  else
    alias ls='ls --color=auto'
  fi
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

###**##################################################**###
## **                IF YOU USE RVM:                   ** ##
## ** REMOVE THIS LINE FROM .profile AND .bash_profile ** ##
## **       OTHERWISE WARNING WILL PERSIST!!           ** ##
###**##################################################**###
## Add RVM to PATH for scripting. Make sure this is the last PATH variable change. ##
if [[ "$VIRTUAL_ENV_OLD" ]]; then
  export PATH="$VIRTUAL_ENV_OLD:$PATH:$HOME/.rvm/bin"
fi
if [[ "$GEM_HOME_OLD" ]];then
  export PATH="$GEM_HOME_OLD:$PATH:$HOME/.rvm/bin"
fi

## Load RVM into a shell session *as a function* ##
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

## Set terminal ruby environment back to system ##
RUN="rvm use system"
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  ${RUN}
fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [[ -f ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi
if [[ -f ~/.profile ]]; then
  . ~/.profile
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo -e terminal || echo -e error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## Do things ##
alias fsearch='flatpak search'
alias fuckingown='sudo chown -Rh $USER /home/$USER'
alias pup='pip3 list --outdated --format=freeze | grep -v "^\-e" | cut -d = -f 1  | xargs -n1 pip3 install -U'
alias speedtest='speedtest-cli'
alias neo='clear && neofetch'
alias tclock='tty-clock -s -c -t -n -C 5'

## Shortcuts ##
alias resh='source ~/.zshrc'
alias c='clear'
alias l='ls'
alias la='ls -A'
alias ll='ls -lA'
alias mkdir='mkdir -p'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias pa='ps aux | grep'
alias papy='ps -ef | grep python'
alias pwsh='TERM=xterm pwsh'
alias video='lspci -k | grep -EA3 "VGA|3D|Display"'
alias x='exit'
alias whatsmyip='dig +short myip.opendns.com @resolver1.opendns.com'
alias jwatch='journalctl -f --output cat -u'

## Editors ##
alias vi='vim'
alias sudo='sudo '

## Navigation ##
alias ..='cd ..'
alias desktop='cd ~/Desktop/'
alias docs='cd ~/Documents/'
alias downloads='cd ~/Downloads/'
alias etc='cd /etc'
alias home='cd ~/'
alias opt='cd /opt'
alias raid0="cd /mnt/Raid0"

## Open in vim ##
alias bashrc='sudo vim ~/.bashrc'

## Stop after sending count echo -e _REQUEST packets ##
alias ping='ping -c 5'

## Do not wait interval 1 second, go fast ##
alias fastping='ping -c 100 -s.2'
alias ports='netstat -tulanp'

## Display ports used by program ##
alias psport='sudo netstat -tulnp | grep'

## do not delete / or prompt if deleting more than 3 files at a time ##
alias rm='rm -I --preserve-root'

## confirmation ##
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

## Parenting changing perms on / ##
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

## become root ##
alias root='sudo -i'

## reboot / halt / poweroff ##
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

## this one saved by butt so many times ##
alias wget='wget -c'
alias rm='rm -i'

## set some other defaults ##
alias df='df -H'

## Python stuffs ##
alias pip-update='cat requirements.txt | xargs -n 1 python3 -m pip install'

## Remove Python virtual environment from path so it's not added multiple times. ##
PATH="${PATH//$VIRTUAL_ENV_OLD}"

## NVM ##
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias shasum="sha1sum"

alias ay='sudo apt-get -y install'
alias yup='sudo apt-get -y update && sudo apt-get -y upgrade'
alias yup-new='sudo apt-get -y update && sudo apt-get --with-new-pkgs -y upgrade'
alias ar='sudo apt-get remove -y --purge'