# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kevin"

# Example aliases
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias lsmsp="ls /dev/ |grep -i 'tty\.u'"
alias m='make'
alias r='./run'
alias mc='make clean'
alias vi='vim'
alias g='gvim'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias v='valgrind ./run'
alias docs='cd ~/Documents'
alias down='cd ~/Downloads'
alias opt='cd /opt'
alias cd..='cd ..'
alias cp='cp -r'
alias repos='cd ~/Repos'
alias gs='git status'
alias gp='git push'
alias ins='sudo apt-get install'
alias goamulet='cd ~/Repos/project-amulet'
alias godevenv='cd ~/Repos/project-amulet/devEnv'
alias dins='sudo dpkg -i'
alias aptupgrade='sudo apt-get dist-upgrade -y'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
 DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn ruby gitfast mercurial debian sublime sudo)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/ti-mspgcc/bin

#source /opt/tinyos-main/tinyos.env
#export MOTECOM=serial@/dev/ttyUSB0:tmote 
export AMULET_ROOT=/home/kevin/Repos/project-amulet/
export QPC_ROOT=/home/kevin/Repos/lib-qpc