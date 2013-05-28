# Oh my zsh integration
ZSH=$HOME/.oh-my-zsh

# Plugins
plugins=(git rbenv)

ZSH_THEME="agnoster-light"

# Completion dots
COMPLETION_WAITING_DOTS="true"

# Disable autocorrect on enter
unsetopt correct_all

# Now load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Path
PATH=/usr/local/bin:/usr/local/lib/node:/usr/local/sbin:/usr/local/var:/usr/local/share/npm/bin:/usr/local/share/npm/bin:$HOME/.dotfiles/bin:$PATH
# MacPorts
PATH=/opt/local/bin:/opt/local/sbin:$PATH
# NodeJS
NODE_PATH=/usr/local/lib/node_modules
# Heroku
PATH=/usr/local/heroku/bin:$PATH

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Unbreak broken, non-colored terminal
export TERM='xterm-256color'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

# Save history
export HISTSIZE=10000
export HISTFILE=~/.zsh_history
export SAVEHIST=$HISTSIZE

export VISUAL=vim
export EDITOR=vim

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

# Sudo support for rbenv
function rbenvsudo(){
  executable=$1
  shift 1
  sudo $(rbenv which $executable) $*
}

# tmux
alias tmux='TERM=xterm-256color tmux -2'
alias tmuxinator='TERM=xterm-256color tmuxinator'
alias mux='TERM=xterm-256color mux'

# tmuxinator
[[ -s "$HOME/.tmuxinator/scripts/tmuxinator" ]] && source "$HOME/.tmuxinator/scripts/tmuxinator"

# full 256 colors in terminal (run "tput colors" to check)
export TERM=xterm-256color

# sub - https://github.com/37signals/sub
eval "$($HOME/.91/bin/91 init -)"

# in terminal vim we want access to the Ctrl+ combinations
alias vim="stty stop '' -ixoff ; vim"

# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

# VI-mode
# http://www.techrepublic.com/blog/opensource/using-vi-key-bindings-in-bash-and-zsh/193
bindkey -v

# 10ms for key sequences
KEYTIMEOUT=1

source $HOME/.dotfiles/zsh/aliases.sh
source $HOME/.dotfiles/zsh/functions.sh

# Shaves about 0.5s off Rails boot time (when using perf patch). Taken from https://gist.github.com/1688857
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# disable oh-my-zsh update prompts, upgrade with upgrade_oh_my_zsh
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true
