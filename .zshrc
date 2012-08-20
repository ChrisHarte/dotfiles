# ---------------------------------------------
# Oh my zsh integration
ZSH=$HOME/.oh-my-zsh

# Do not move
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(git bundler brew pow gem rails3 rbenv)

# Completion dots
COMPLETION_WAITING_DOTS="true"

# ---------------------------------------------
# Load the zsh functions for the fancy grb prompt
fpath=($fpath $HOME/.dotfiles/zsh/func)

# Setup prompt
setopt promptsubst
autoload -U promptinit
promptinit
prompt grb

# Colors
autoload -U colors
colors
setopt prompt_subst

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Path
PATH=/usr/local/bin:/usr/local/lib/node:/usr/local/sbin:/usr/local/var:/usr/local/share/npm/bin:/usr/local/share/npm/bin:$HOME/.dotfiles/bin:$PATH
NODE_PATH=/usr/local/lib/node_modules

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Use macvim for git commits
export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

# Sudo support for rbenv
function rbenvsudo(){
  executable=$1
  shift 1
  sudo $(rbenv which $executable) $* 
}

# ----------------------------------------------
alias reload=". ~/.zshrc"

alias ls='ls -G'
alias ll='ls -lG'
alias duh='du -csh'

alias c="clear"
alias h="history"

alias r=rails

alias m="mvim $@" # mvim current directory
alias nano="vim $@" # stop using nano

alias emptymail="cat /dev/null > /var/mail/john"
alias keygen="cd ~/.ssh && ssh-keygen -t dsa"
alias flushdns="dscacheutil -flushcache"
alias hosts="sudo nano /etc/hosts" # edit hosts

# GIT
alias con="grep -r'<<<<' *"
alias omg="omglog"

# disable / enable spotlight
alias spotoff="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spoton="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spothide="sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"
alias spotshow="sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"

# mirror site
alias mirrorurl='wget -m -k -K -E $@'

# start mongodb
alias mongodb="mongod run --dbpath ~/.dotfiles/local_db --bind_ip 127.0.0.1 --rest"

# start tunnels for ssl -> pow
alias ssl="sudo tunnels"
