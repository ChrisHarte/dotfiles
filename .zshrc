# ZSH
ZSH=$HOME/.oh-my-zsh

# ZSH Config
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(git bundler brew pow gem rails3 rbenv)

# Do not move
source $ZSH/oh-my-zsh.sh

# ---------------------------------------------

# Path
PATH=/usr/local/bin:/usr/local/lib/node:/usr/local/sbin:/usr/local/var:/usr/local/share/npm/bin:/usr/local/share/npm/bin:$HOME/.dotfiles/bin:$PATH
NODE_PATH=/usr/local/lib/node_modules

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Colors
autoload -U colors
colors
setopt prompt_subst

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Prompt
local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

# RBENV
RPROMPT='%{$fg[white]%} $(rbenv version-name)$(~/.dotfiles/bin/git-cwd-info.rb)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Use MacVim for git commits
export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

function rbenvsudo(){
  executable=$1
  shift 1
  sudo $(rbenv which $executable) $* 
}

# ----------------------------------------------

alias reload=". ~/.zshrc"

alias c="clear"
alias h="history"

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
