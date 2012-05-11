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
# alias unicorn="bundle exec unicorn --port 3000"

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

# pep8
# sudo easy_install pep8

# create .pem file
# cat server.key server.crt > pound.pem

# check pound config
# pound -v -c

# unicorn
alias uni="rvmsudo bundle exec unicorn -l 127.0.0.1 -p 80"
alias unir="rvmsudo bundle exec unicorn_rails -l 127.0.0.1 -p 80"

# edit hosts
alias hosts="sudo nano /etc/hosts"

# disable / enable spotlight
alias spotoff="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spoton="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spothide="sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"
alias spotshow="sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"

# ---------------------------------------------------------------------

# Define Vim wrappers which unsets GEM_HOME and GEM_PATH before
# invoking vim and all known aliases
#
# @author Wael Nasreddine <wael.nasreddine@gmail.com>
#function define_vim_wrappers()
#{
  #vim_commands=(
    #eview evim gview gvim gvimdiff gvimtutor rgview
    #rgvim rview rvim vim vimdiff vimtutor xxd mvim
  #)

  #for cmd in ${vim_commands[@]}; do
    #cmd_path=`/usr/bin/env which -a "${cmd}" 2>/dev/null | grep '^/'`
    #if [ -x "${cmd_path}" ]; then
      #eval "function ${cmd} () { (unset GEM_HOME; unset GEM_PATH; $cmd_path \$@) }"
    #fi
  #done
#}
#define_vim_wrappers

#alias mvim='rvm system do ~/bin/mvim $@'

# clone site
alias cloneurl='wget -m -k -K -E $@'

# start mongodb
alias mongodb="mongod run --config /usr/local/etc/mongod.conf --rest"

