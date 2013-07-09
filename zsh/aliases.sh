alias reload="source ~/.zshrc"

alias exe="chmod +x $*"
alias concat="grep -r'<<<<' *"
alias copy="cp -r $*" # recursive copy
alias find="sudo find / -name $*"
alias crush="optipng -o 7"
alias hosts="sudo vim /etc/hosts" # edit hosts

alias free="free -m"
alias df="df -h"
alias ll='ls -laG'
alias ls='ls -G'
alias l='ls -lhG'
alias duh='du -csh'
alias c=clear
alias q=exit
alias v=vim
alias vi=vim
alias m=mvim
alias hist=history
alias clearhist="rm $HISTFILE"
alias pcat='pygmentize'

# DEVELOPMENT
alias git-pup="git pull && git submodule init && git submodule update && git submodule status"
alias reattach="tmux attach || tmux new" # create/reattach last session

# RAILS
alias rehash="rbenv rehash"
alias b="bundle exec"
alias binstubs="bundle install --deployment --binstubs" # generate executables in bundle
alias r="bundle exec rails"
alias rc="bundle exec rails console"
alias migrate="bundle exec rake db:migrate"
alias routes="rake routes"
# alias t="ruby -Ilib:test $*"
alias t='script/test'
alias tt='bundle exec rake test'
alias worker="bundle exec rake jobs:work"
alias rake="bundle exec rake $*"
alias devlog="tail -f log/development.log"
alias chrome="/usr/bin/open -a '/Applications/Google Chrome.app'"
alias z=zeus

# OSX
alias killdock="Killall Dock" # Force all spaces to restart, thus resetting all spaces wallpaper to whatever's on desktop 1
alias emptymail="cat /dev/null > /var/mail/john"
alias flushdns="dscacheutil -flushcache"
alias fontreset="fc-cache -vf" # linux, reset font cache
