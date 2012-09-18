# ---------------------------------------------
# Oh my zsh integration
ZSH=$HOME/.oh-my-zsh

# Plugins
plugins=(git bundler brew pow gem rails3 rbenv)

# Completion dots
COMPLETION_WAITING_DOTS="true"

# Now load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ---------------------------------------------
# Load the zsh functions for the fancy grb prompt
fpath=($fpath $HOME/.dotfiles/zsh/func)

# Setup prompt
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

# tmux
alias tmux="TERM=screen-256color-bce tmux"

# ----------------------------------------------
alias reload="source ~/.zshrc"

alias la='ls -la'
alias ls='ls -G'
alias ll='ls -lG'
alias duh='du -csh'

alias c="clear"
alias h="history"

alias find="sudo find / -name $*"
alias rehash="rbenv rehash"

alias version="ruby --version"
alias r=rails
alias migrate="bundle exec rake db:migrate"

alias t="ruby -Ilib:test $*"

alias m="mvim $*"
alias vi="vim $*"

alias emptymail="cat /dev/null > /var/mail/john"
alias keygen="cd ~/.ssh && ssh-keygen -t dsa"
alias flushdns="dscacheutil -flushcache"
alias hosts="sudo nano /etc/hosts" # edit hosts

alias p="ps aux | grep $*"

alias con="grep -r'<<<<' *"

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

# you can do 'time [command]' to measure the time it take to run something

# Exists to fully update the git repo that you are sitting in...
alias git-pup="git pull && git submodule init && git submodule update && git submodule status"

# Force all spaces to restart, thus resetting all spaces wallpaper to whatever's on desktop 1
alias kill-dock="Killall Dock"

# Port proxy'ing for Pow => port-proxy 3501 my-app-dirname
function port-proxy(){
  echo $1 > ~/.pow/$2
}
