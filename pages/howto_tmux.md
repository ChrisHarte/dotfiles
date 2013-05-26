## tmux

    prefix+s          view sessions 
  
best to go for a 75x25 split

    prefix+[number]   jump to screen

    prefix+{          move to left

    prefix+"          split horizontal
    prefix+%          split vertical

Remember Ctrl+A then press modifier (e.g. 'c'), not Ctrl+A+C!

    Ctrl+a " - split pane horizontally.
    Ctrl+a % - split pane vertically.
    Ctrl+a arrow key - switch pane.

Hold Ctrl+a, don't release it and hold one of the arrow keys - resize pane.
    
    Ctrl+a c - (c)reate a new window.
    Ctrl+a n - move to the (n)ext window.
    Ctrl+a p - move to the (p)revious window.

NOTE: tmux screws up mouse select, hold SHIFT+rightclick to copy
NOTE: tmux screws up copy+paste in MacVim, fix below

    --close tmux
    tmux kill-server

### tmuxinator

    rbenv local system
    sudo gem install tmuxinator
    
