# ---------------------------------------------
#
# Oh my zsh integration
ZSH=$HOME/.oh-my-zsh

# Plugins
plugins=(git bundler gem rails3 rbenv)

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

export VISUAL=vim
export EDITOR=vim

# Sudo support for rbenv
function rbenvsudo(){
  executable=$1
  shift 1
  sudo $(rbenv which $executable) $*
}

# tmux
alias tmux="TERM=screen-256color-bce tmux"

# full 256 colors in terminal
# run "tput colors" to check
export TERM=xterm-256color

# sub - https://github.com/37signals/sub
eval "$($HOME/.91/bin/91 init -)"

# start tmux automatically
# if [ "$TMUX" = "" ]; then tmux; fi

# in terminal vim we want access to the Ctrl+ combinations
alias vim="stty stop '' -ixoff ; vim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

# ----------------------------------------------

# ctrl+r = history autocomplete

alias reload="source ~/.zshrc"

alias free="free -m"
alias la='ls -la'
alias ls='ls -G'
alias ll='ls -lG'
alias duh='du -csh'
alias cls="clear"
alias hist="history"
alias find="sudo find / -name $*"

alias verify="md5 $*" # check md5 tag for file
alias tardir="tar -zcvf $0 $1"
alias exe="chmod +x $*"

alias m="mvim $*"
alias vi="vim $*"

alias emptymail="cat /dev/null > /var/mail/john"
alias keygen="cd ~/.ssh && ssh-keygen -t dsa"
alias flushdns="dscacheutil -flushcache"
alias hosts="sudo nano /etc/hosts" # edit hosts

alias concat="grep -r'<<<<' *"
alias copy="cp -r $*" # recursive copy
alias copyweb='wget -m -k -K -E $@' # mirror site
alias fontreset="fc-cache -vf" # linux, reset font cache

# ----------------------------------------------

#alias psqlocal="psql -h localhost $*"
#alias psqldump="pg_dump -Fc --no-acl --no-owner -h localhost -U $0 -d $1 > $2.dump"
#alias psqlrestore="pg_restore -i -U $0 -d $1 -v $2"

# ----------------------------------------------

alias rehash="rbenv rehash"
alias r=rails
alias migrate="bundle exec rake db:migrate"
alias routes="rake routes"
alias t="ruby -Ilib:test $*"
alias jobstart="bundle exec rake jobs:work"

alias startsolr="rake sunspot:solr:start"
alias indexsolr="rake sunspot:solr:reindex"
alias indexweb="heroku rake sunspot:reindex"

# fully update the git repo you're in
alias git-pup="git pull && git submodule init && git submodule update && git submodule status"

# ----------------------------------------------

alias check="ps aux | grep $*"
alias ng="sudo service nginx $@"

function stopnginx(){
  sudo kill -QUIT $( cat /var/run/nginx.pid )
}

alias shoot="kill -9 $@" # stronger kill process
alias kick="touch tmp/restart.txt" # passenger restart
alias poweroff="sudo shutdown -h -P +1 " # power off machine after 1 minute

# ----------------------------------------------

# disable / enable spotlight
#alias spotoff="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
#alias spoton="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
#alias spothide="sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"
#alias spotshow="sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"

#alias ssl="sudo tunnels" # start tunnels for ssl -> pow

# Force all spaces to restart, thus resetting all spaces wallpaper to whatever's on desktop 1
alias killdock="Killall Dock"

# Port proxy'ing for Pow => port-proxy 3501 my-app-dirname
function port-proxy(){
  echo $1 > ~/.pow/$2
}

# ----------------------------------------------

# Print all 256 colors to terminal for testing
aa_256 ()
{
  ( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;
  for i in {0..256};
  do
  o=00$i;
  echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;
  done )
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
