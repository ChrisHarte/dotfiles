# ZSH
ZSH=$HOME/.oh-my-zsh

# ZSH Config
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(git bundler brew gem pow rails3 rbenv)

# Do not move
source $ZSH/oh-my-zsh.sh

# ---------------------------------------------

# Path
PATH=/usr/local/bin:/usr/local/lib/node:/usr/local/sbin:/usr/local/var:/usr/local/share/npm/bin:/usr/local/share/npm/bin:$HOME/bin:$PATH
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
RPROMPT='%{$fg[white]%} $(rbenv version-name)$(~/bin/git-cwd-info.rb)%{$reset_color%}'

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
alias emptymail="cat /dev/null > /var/mail/john"
alias keygen="cd ~/.ssh && ssh-keygen -t dsa"
alias flushdns="dscacheutil -flushcache"
alias hosts="sudo nano /etc/hosts" # edit hosts

# GIT
alias con="grep -r'<<<<' *"
alias omg="omglog"

# ctags (brew install ctags)
alias ctags="`brew --prefix`/bin/ctags"

# disable / enable spotlight
alias spotoff="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spoton="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spothide="sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"
alias spotshow="sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"

# mirror site
alias mirrorurl='wget -m -k -K -E $@'

# start mongodb
alias mongodb="mongod run --dbpath ~/bin/local_db --bind_ip 127.0.0.1 --rest"

# fix invalid gemset datestamps (when specs go gay)
# alias patchstamps="perl -p -i -e 's/ 00:00:00.000000000Z//' ~/.rvm/gems/ruby-1.8.7-p358@homesav/specifications/*.gemspec"

# start tunnels for ssl -> pow
alias ssl="sudo tunnels"

# install virtualbox with ie7,8,9 (admin password=Password1)
alias installie789="curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash"
alias installie7='curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="7" bash'
alias installie8='curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="8" bash'
alias installie9='curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="9" bash'
