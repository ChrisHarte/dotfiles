alias reload="source ~/.zshrc"

# COMPRESSION
alias compress="tar -zcvf $0 $1"
alias exe="chmod +x $*"

# FILES
alias concat="grep -r'<<<<' *"
alias copy="cp -r $*" # recursive copy
alias find="sudo find / -name $*"
alias crush="optipng -o 7" 

# KEYS
alias hosts="sudo nano /etc/hosts" # edit hosts
alias keygen="cd ~/.ssh && ssh-keygen -t rsa"
alias verify="md5 $*" # check md5 tag for file

# POWER
alias stop="pkill $@" # kill by process name
alias die="kill -9 $@" # stronger kill process
alias poweroff="sudo shutdown -h -P +0" # power off machine after 0 minutes

# SHORTCUTS
alias free="free -m"
alias la='ls -la'
alias ls='ls -G'
alias dir=ls
alias l=ls
alias ll='ls -lG'
alias duh='du -csh'
alias c=clear
alias cls=clear
alias h=history
alias q=exit
alias v=vim
alias vi=vim
alias m=mvim
alias ch="rm $HISTFILE"
alias pcat='pygmentize'

# DEVELOPMENT
alias git-pup="git pull && git submodule init && git submodule update && git submodule status"
alias reattach="tmux attach || tmux new" # create/reattach last session

# RAILS
alias rehash="rbenv rehash"
alias b="bundle"
alias binstubs="bundle install --deployment --binstubs" # generate executables in bundle
alias r="bundle exec rails"
alias rc="bundle exec rails console"
alias migrate="bundle exec rake db:migrate"
alias routes="rake routes"
alias t="ruby -Ilib:test $*"
alias worker="bundle exec rake jobs:work"
alias kapow="touch tmp/restart.txt" # passenger/pow restart
alias rake="bundle exec rake $*"
alias log="tail -f log/development.log"
alias chrome="/usr/bin/open -a '/Applications/Google Chrome.app'"

# OSX
alias killdock="Killall Dock" # Force all spaces to restart, thus resetting all spaces wallpaper to whatever's on desktop 1
alias emptymail="cat /dev/null > /var/mail/john"
alias flushdns="dscacheutil -flushcache"
alias fontreset="fc-cache -vf" # linux, reset font cache
