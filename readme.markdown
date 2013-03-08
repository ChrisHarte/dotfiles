## Install

    git clone git@github.com:johnantoni/dotfiles.git ~/.dotfiles

    cd ~/.dotfiles
    rake
    
## Dev Machine Setup

### Switch to ZSH

    sudo aptitude install zsh
    
    whereis zsh
    => /bin/zsh
    
    # set zsh as default
    chsh -s /bin/zsh
    
#### Install oh-my-zsh
##### https://github.com/robbyrussell/oh-my-zsh

    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

### RBENV on Ubuntu 12.04
#### https://gist.github.com/1200482

    sudo aptitude install libreadline-dev zlib1g-dev openssl libssl0.9.8 libssl-dev
    git clone git@github.com:sstephenson/rbenv.git ~/.rbenv
    
    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    
    which openssl
    => /usr/bin/openssl
    
    CONFIGURE_OPTS=--with-openssl-dir=/usr/bin rbenv install 1.9.3-p374
    
    rbenv global 1.9.3-p374

### Error installing debugger-linecache in Ruby 1.9.3

    bundle update debugger-linecache
    bundle install

### Error installing ruby debugger

    gem install debugger
    rbenv rehash
    bundle install

### ImageMagick on Ubuntu (12.04)

    sudo apt-get install imagemagick

    gem install mini_magick

### RMagick gem on Ubuntu (12.04)

    sudo aptitude install graphicsmagick-libmagick-dev-compat libmagickwand-dev 

    gem install rmagick
    
    rbenv rehash

### Postgres & PG gem on Ubuntu

    sudo aptitude install postgresql-9.1 libpq-dev
    
    sudo su postgres -c psql
    
    postgres=# CREATE ROLE <username> SUPERUSER LOGIN PASSWORD '<yourpassword>';
    postgres=# \q
    
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

### Nokogiri - libxml2 is missing

    sudo apt-get install libxml2 libxml2-dev libxslt1-dev
    gem install nokogiri

### Java for Ubuntu

    sudo apt-get install openjdk-7-jre

### dropbox on Ubuntu

    sudo apt-get update && sudo apt-get install nautilus-dropbox
    dropbox start
    dropbox status
    dropbox stop
    /var/lib/dropbox/.dropbox-dist/dropboxd

    echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p

### ImageMagick on OSX (MiniMagick is recommended)

    brew install imagemagick jpeg libtiff jasper

https://coderwall.com/p/wnomjg

    cd /usr/local/Cellar/imagemagick/6.8.0-10/lib   
    ln -s libMagick++-Q16.7.dylib   libMagick++.dylib
    ln -s libMagickCore-Q16.7.dylib libMagickCore.dylib
    ln -s libMagickWand-Q16.7.dylib libMagickWand.dylib

    brew uninstall libtool
    brew install --fresh libtool
    brew link libtool
    brew cleanup

## Extras

### Ubuntu 12.04 + ATI 7700 (multi-monitor setup)

1. Update to the latest kernel then goto Additional Drivers, install the ATI Recommended driver, with both monitors plugged in (hdmi to 1, displayport to 2).
2. You may need to increase the overscan for the hdmi as there may be a black border round the screen, open AMD Catalyst Center and enable manual overscan then increase till screen fills entirely.
3. Now to enable the Multi-Monitor feature you will have to run the Catalyst Control center in Administrator mode, via:

    sudo amdcccle
    
4. Now "Display Manager", "Multi-Display" and select "Multi-display desktop with display(s) 2"
5. Apply and you should be done.

An alternate way is to wipe the initial xorg setup via:

    sudo aticonfig --initial -f

Then 

    gksu amdcccle
    
To run the Catalyst Control center in Admin mode, but this second command does not seem to stick.

    => Tested on Ubuntu 12.04.2 (server LTM edition with MATE desktop)
    => Linux 3.2.0-38-generic #61-Ubuntu SMP Tue Feb 19 12:18:21 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux

### MINT ~ Make Google Chrome the default browser

    gconftool-2 --type string -s /desktop/gnome/url-handlers/http/command "chromium %s"

### Easier deploys with RECAP

https://tomafro.net/2012/12/deploying-harmonia-with-recap


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
