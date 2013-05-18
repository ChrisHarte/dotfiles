## Install

1) git clone

    git clone git@github.com:johnantoni/dotfiles.git ~/.dotfiles

2) install zsh

    sudo aptitude install zsh

    whereis zsh
    => /bin/zsh

    # set zsh as default
    chsh -s /bin/zsh

3) install oh-my-zsh

    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

3.1) install ruby (if you don't have it)

    sudo aptitude install ruby1.9.1-full
    sudo gem install rake

4) setup

    cd ~/.dotfiles
    rake

5) install vundle + plugins

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall

6) compile command-t

    cd ~/.vim/bundle/Command-T/ruby/command-t
    rbenv local system
    ruby extconf.rb
    make && sudo make install
