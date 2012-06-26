# ZSH
ZSH=$HOME/.oh-my-zsh

# ZSH Config
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(git bundler brew gem pow rails3 rvm)

# Do not move
source $ZSH/oh-my-zsh.sh

# ---------------------------------------------

# Path
PATH=/usr/local/bin:/usr/local/lib/node:/usr/local/sbin:/usr/local/var:/usr/local/share/npm/bin:/usr/local/share/npm/bin:$HOME/bin:$PATH
NODE_PATH=/usr/local/lib/node_modules
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# Colors
autoload -U colors
colors
setopt prompt_subst

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
#alias duh='du -csh'
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

RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(~/bin/git-cwd-info.rb)%{$reset_color%}'

# Replace the above with this if you use rbenv
# RPROMPT='%{$fg[white]%} $(~/.rbenv/bin/rbenv version-name)$(~/bin/git-cwd-info.rb)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# ----------------------------------------------

# Common
alias cls="clear"
alias emptymail="cat /dev/null > /var/mail/john"
alias keygen="cd ~/.ssh && ssh-keygen -t dsa"
alias flushdns="dscacheutil -flushcache"
alias reload=". ~/.zshrc"

# NGINX for SSH
alias ng="sudo nginx"

# Rails
alias edge="export PATH=$HOME/.local/bin:$PATH"
alias pryr="pry -r ./config/environment"

# RVM
# switch to global rvm gemset
alias global="rvm use default@global"

# Directories
alias code="cd ~/code"
alias projects="cd ~/projects"
alias desktop="cd ~/Desktop"
alias downloads="cd ~/Downloads"

# GIT
alias con="grep -r'<<<<' *"
alias omg="omglog"

# ctags (brew install ctags)
alias ctags="`brew --prefix`/bin/ctags"

# unicorn
alias uni="rvmsudo bundle exec unicorn -l 127.0.0.1 -p 80"

# edit hosts
alias hosts="sudo nano /etc/hosts"

# disable / enable spotlight
alias spotoff="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spoton="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spothide="sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"
alias spotshow="sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"

# clone a site
alias clonesite='wget -m -k -K -E $@'

# start mongodb
alias mongodb="mongod run --dbpath ~/bin/local_db --bind_ip 127.0.0.1 --rest"

# fix invalid gemset datestamps (when specs go gay). e.g. "patchstamps ruby-1.8.7-p358@homesav"
alias patchstamps="perl -p -i -e 's/ 00:00:00.000000000Z//' ~/.rvm/gems/ruby-1.8.7-p358@homesav/specifications/*.gemspec"

# start tunnels for ssl -> pow
alias ssl="rvmsudo tunnels"
