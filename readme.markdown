## Install

    git clone git@github.com:johnantoni/dotfiles.git ~/.dotfiles

    cd ~/.dotfiles
    rake

## Ubuntu RBENV

    sudo apt-get install libreadline-dev zlib1g-dev
    git clone git@github.com:sstephenson/rbenv.git ~/.rbenv
    rbenv install 1.9.3-p327 --with-openssl-dir=/usr/local

## RMagick gem on Ubuntu (12.04)

    sudo apt-get install graphicsmagick-libmagick-dev-compat libmagickwand-dev 

    gem install rmagick

## Extras

### VirtualBox

 install virtualbox with ie7,8,9 (admin password=Password1)

    installie789 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash
    installie7 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="7" bash
    installie8 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="8" bash
    installie9 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="9" bash

### Install Libv8 on OSX 10.8

    RUBYOPT=-rrubygems bundle install

### Create Sublime Text command-line shortcut "subl ."

    ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/.dotfiles/bin/subl

### Example Rails Generator

    rails g controller api/ --skip-javascripts --skip-stylesheets --skip-helpers

### Start Mongo locally

    mongod run --dbpath ~/.dotfiles/local_db --bind_ip 127.0.0.1 --rest

### time [command]

you can do 'time [command]' to measure the time it take to run something
