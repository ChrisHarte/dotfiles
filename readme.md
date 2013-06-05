## Install

### 1. git clone

    git clone git@github.com:johnantoni/dotfiles.git ~/.dotfiles

### 2. install zsh

    sudo aptitude install zsh

    whereis zsh
    => /bin/zsh

    # set zsh as default
    chsh -s /bin/zsh

### 3. install oh-my-zsh

    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

### 3.1. install ruby (if you don't have it)

    sudo aptitude install ruby1.9.1-full
    sudo gem install rake

### 4. setup

    cd ~/.dotfiles
    rake

### 5. install vundle + plugins

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall

### 6. compile command-t

    cd ~/.vim/bundle/Command-T/ruby/command-t
    rbenv local system
    ruby extconf.rb
    make && sudo make install

### 7. install pygmentize for syntax highlighting

    sudo easy_install Pygments

### 8. use zeus instead of pow

we like speed and zeus is the bomb at this, it's built to run outside bundler so there's NO need to install it in your Gemfile. So:

    cd ~
    gem install zeus

Next cd to your app dir

    cd ~/projects/myapp

Start Zeus

    zeus start

And run one of the commands (e.g. your rails server)

    zeus server
    -- or shorthand
    zeus s

Your app will now boot in less than a second, quicker than rails server, not as simpler as pow but still quicker for restarts.

If you do kill zeus accidentally and it gives you error .zeus.sock error messages you can fix this by finding and deleting the sock file

    locate zeus.sock
    => ~/.zeus.sock
    rm ~/.zeus.sock

You can run rake commands and the generators the same with

    rails g model ...   => zeus g model ...
    rake db:migrate     => zeus rake db:migrate
    rails console       => zeus console / zeus c

Quit with Ctrl+C

### 9. Fonts & Colours

#### Adobe Source Code Pro

* [https://github.com/adobe/Source-Code-Pro](https://github.com/adobe/Source-Code-Pro)
