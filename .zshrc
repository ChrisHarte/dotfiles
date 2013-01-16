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
alias reload="source ~/.zshrc"

alias term="ssh ubuntu"

alias tardir="tar -zcvf $0 $1"

alias exe="chmod +x $*"

alias free="free -m"

alias la='ls -la'
alias ls='ls -G'
alias ll='ls -lG'
alias duh='du -csh'

alias cls="clear"
alias hist="history"

# check md5 tag for file
alias verify="md5 $*"

alias find="sudo find / -name $*"
alias rehash="rbenv rehash"

alias version="ruby --version"
alias r=rails
alias migrate="bundle exec rake db:migrate"
alias routes="rake routes"
alias t="ruby -Ilib:test $*"
alias jobstart="bundle exec rake jobs:work"

alias h="heroku $*"
alias hlog="tail logs > heroku logs --tail"

alias solrstart="rake sunspot:solr:start"
alias solrindex="rake sunspot:solr:reindex"

alias m="mvim $*"

alias nano="vim $*"
alias vi="vim $*"

alias emptymail="cat /dev/null > /var/mail/john"
alias keygen="cd ~/.ssh && ssh-keygen -t dsa"
alias flushdns="dscacheutil -flushcache"
alias hosts="sudo nano /etc/hosts" # edit hosts

alias p="ps aux | grep $*"

alias con="grep -r'<<<<' *"

alias localbrowser="open -a Google\ Chrome --args --disable-web-security"

alias psqlocal="psql -h localhost $*"
alias psqlcheck="ps -aef|grep 'postgres'" # check postgres is running

alias psqldump="pg_dump -Fc --no-acl --no-owner -h localhost -U $0 -d $1 > $2.dump"
alias psqlrestore="pg_restore -i -U $0 -d $1 -v $2"

# recursive copy
alias copy="cp -r $*"

# disable / enable spotlight
alias spotoff="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spoton="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spothide="sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"
alias spotshow="sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"

# mirror site
alias mirror-site='wget -m -k -K -E $@'

# start tunnels for ssl -> pow
alias ssl="sudo tunnels"

# Exists to fully update the git repo that you are sitting in...
alias git-pup="git pull && git submodule init && git submodule update && git submodule status"

# Force all spaces to restart, thus resetting all spaces wallpaper to whatever's on desktop 1
alias killdock="Killall Dock"

# Port proxy'ing for Pow => port-proxy 3501 my-app-dirname
function port-proxy(){
  echo $1 > ~/.pow/$2
}

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

alias ngstart="sudo service nginx start"
alias ngstop="sudo service nginx stop"
alias ngrestart="sudo service nginx restart"
alias ngcheck="sudo service nginx configtest"

alias ngrunning="ps aux | grep nginx"
alias aprunning="ps aux | grep apach"

alias kick="touch tmp/restart.txt" # passenger restart

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# ctrl+r = history autocomplete
