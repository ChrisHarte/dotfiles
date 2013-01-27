## Install

    git clone git@github.com:johnantoni/dotfiles.git ~/.dotfiles

    cd ~/.dotfiles
    rake
    
## Dev Machine Setup

### Ubuntu RBENV
#### https://gist.github.com/1200482

    sudo aptitude install libreadline-dev zlib1g-dev openssl libssl0.9.8 libssl-dev
    git clone git@github.com:sstephenson/rbenv.git ~/.rbenv
    which openssl
    
    CONFIGURE_OPTS=--with-openssl-dir=/usr/local rbenv install 1.9.3-p327
    
    rbenv global 1.9.3-p327

### Error installing debugger-linecache in Ruby 1.9.3

    bundle update debugger-linecache
    bundle install

### Error installing ruby debugger

    gem install debugger
    rbenv rehash
    bundle install

### RMagick gem on Ubuntu (12.04)

    sudo aptitude install graphicsmagick-libmagick-dev-compat libmagickwand-dev 

    gem install rmagick
    
    rbenv rehash

### PG gem on Ubuntu

    sudo aptitude install libpq-dev
    
    gem install pg
    rbenv rehash

### mysql2 gem on Ubuntu

    sudo aptitude install mysql-server libmysqlclient-dev
    gem install mysql2
    rbenv rehash

### therubyracer gem on Ubuntu (12.04) "Could not find a JavaScript runtime."

    sudo aptitude install libv8-dev nodejs
    gem install libv8
    rbenv rehash
    gem install therubyracer execjs

### Java for Ubuntu

    sudo apt-get install openjdk-7-jre

### dropbox on Ubuntu

    sudo apt-get update && sudo apt-get install nautilus-dropbox
    dropbox start
    dropbox status
    dropbox stop
    /var/lib/dropbox/.dropbox-dist/dropboxd

## Extras

### chkconfig

    sudo apt-get install chkconfig
    sudo chkconfig --add nginx    
    sudo chkconfig nginx on  


### VirtualBox

 install virtualbox with ie7,8,9 (admin password=Password1)

    installie789 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash
    installie7 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="7" bash
    installie8 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="8" bash
    installie9 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="9" bash

### Copy ISO to USB Stick
  
    diskutil list
    diskutil unmountDisk /dev/disk1
    sudo dd if=ubuntu-12.04.1-server-amd64.iso of=/dev/disk1 bs=8m
    diskutil eject /dev/disk1

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

### Postgres Backup / Restore

    pg_dump -Fc --no-acl --no-owner -h localhost -U username dbname -f dbname.dump

    pg_restore -i -U username -d dbname -v dbname.dump
    
    
