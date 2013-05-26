# tmux

## keys

    ctrl+a s          view sessions 
  
    ctrl+a [number]   jump to screen

    ctrl+a {          move to left

    ctrl+a "          split horizontal
    ctrl+a %          split vertical

    ctrl+a !          break current pane into a new window

    ctrl+a ?          show help

    ctrl+a "          split pane horizontally.
    ctrl+a %          split pane vertically.
    ctrl+a [up]       switch pane.
    
    ctrl+a &          kill a misbehaving screen
    ctrl+a d          close it leaving the window intact
    
    tmux a            re-attach the existing sessions

    ctrl+a c          (c)reate a new window.
    ctrl+a n          move to the (n)ext window.
    ctrl+a p          move to the (p)revious window.

    tmux kill-server  close tmux

## notes

With splists it's best to go for a 75x25 split

Remember Ctrl+A then press modifier (e.g. 'c'), not Ctrl+A+C!
Hold Ctrl+a, don't release it and hold one of the arrow keys - resize pane.

NOTE: tmux screws up mouse select, hold SHIFT+rightclick to copy
NOTE: tmux screws up copy+paste in MacVim, fix below

## .tmux.conf

### unbind C-b

    set -g prefix C-a

### history

    set -g history-limit 10000

### color

    set -g default-terminal "screen-256color"

### mouse mode

    set -g mode-mouse off
    setw -g mouse-select-window on

### pane switching with the mouse

    setw -g mouse-select-pane on 

### start windows and panes at 1, not 0

    set -g base-index 1
    set -g pane-base-index 1

### be alerted of activity in other windows

    setw -g monitor-activity on
    set -g visual-activity on

### fix copy mode to work like vim

    setw -g mode-keys vi
    bind ` copy-mode
    unbind [
    unbind p
    bind p paste-buffer
    bind -t vi-copy v begin-selection
    bind -t vi-copy y copy-selection
    bind -t vi-copy Escape cancel

### Fix copy & paste for OSX

https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard

    brew install reattach-to-user-namespace

then add to .tmux.conf

    set -g default-command "reattach-to-user-namespace -l zsh"

### tmux powerline theme

    set-option -g status on
    set-option -g status-interval 2
    set-option -g status-utf8 on
    set-option -g status-justify "centre"
    set-option -g status-left-length 60
    set-option -g status-right-length 90
    set-option -g status-left "#(~/.dotfiles/tmux-powerline/powerline.sh left)"
    set-option -g status-right "#(~/.dotfiles/tmux-powerline/powerline.sh right)"

### powerline window list
    
    set-window-option -g window-status-current-format "#[fg=colour235, bg=colour27]⮀#[fg=colour255, bg=colour27] #I ⮁ #W#F #[fg=colour27, bg=colour235]⮀"

### toggle powerline visibility

    bind C-[ run '~/.dotfiles/tmux-powerline/mute_powerline.sh left'      # Mute left statusbar.
    bind C-] run '~/.dotfiles/tmux-powerline/mute_powerline.sh right'     # Mute right statusbar.

### tmux solarized theme

    source ~/.dotfiles/tmux-colors-solarized/tmuxcolors-256.conf

## tmuxinator

    rbenv local system
    sudo gem install tmuxinator
    
