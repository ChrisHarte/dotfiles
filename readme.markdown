## Install

    git clone git@github.com:johnantoni/dotfiles.git ~/.dotfiles

    cd ~/.dotfiles
    rake
    
## Development

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

## Ubuntu 12.04 Fixes

### ATI 7700 (multi-monitor setup)

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

### Graphics artifacts in Sublime Text 2 with ATI graphics card

Run then restart,

    sudo aticonfig --ovt=opengl

### Ubuntu MINT ~ Make Google Chrome the default browser

    gconftool-2 --type string -s /desktop/gnome/url-handlers/http/command "chromium %s"

### Re-enable Hibernate

    gksu nano /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla

Then copy & paste below into the file & save

    [Enable Hibernate]
    Identity=unix-user:*
    Action=org.freedesktop.upower.hibernate
    ResultActive=yes

## Extras

### Port forward 80 to 3000

    sudo iptables -t nat -A OUTPUT -p tcp --dport 80 -d 127.0.0.1/8 -j REDIRECT --to-port 3000

To set this up so it's done automatically on boot,

1.  Backup your current port rules

    sudo sh -c '/sbin/iptables-save > /etc/iptables.save'

2.  Create a new iptables file

    sudo vim /etc/iptables.up.rules
    
3.  Copy & paste this into the file

    *nat 
    -A OUTPUT -p tcp --dport 80 -d 127.0.0.1/8 -j REDIRECT --to-port 3000 
    COMMIT

4. Flush your current settings

    sudo /sbin/iptables -F

5. Import your new settings

    sudo /sbin/iptables-restore < /etc/iptables.up.rules

6. Check

    sudo /sbin/iptables -L

7. Now to make linux to use it on-boot do

    sudo vim /etc/network/if-pre-up.d/iptables

8. Copy and paste contents below into the file

    #!/bin/sh
    /sbin/iptables-restore < /etc/iptables.up.rules

9. Save it, then make it executable

    sudo chmod +x /etc/network/if-pre-up.d/iptables

Now on-boot the new settings will be used.

### Edit HOST file

    sudo vim /etc/hosts
    
From there you can forward traffic to a local domain

    0.0.0.0 site.dev

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

## Google Analytics

### Recommended Custom Reports

* [AK: Content Efficiency Analysis Report](https://www.google.com/analytics/web/template?uid=LwyPayPLQGW9sexqO1WnJA)
* [Browser Report](https://www.google.com/analytics/web/template?uid=Iyk8rmnLSIagCqvsOzxvWA)
* [Compare Days of the Week](https://www.google.com/analytics/web/template?uid=9FcM5FDbT8u8FwIAKEf7fQ)
* [Ecommerce Traffic Report](https://www.google.com/analytics/web/template?uid=h2bCVtOFScSR_DbIX7rGWQ)
* [Keyword Analysis](https://www.google.com/analytics/web/template?uid=KHh2JFGxSo24HtbLsVptEA)
* [Landing Pages Indexed that bring Traffic](https://www.google.com/analytics/web/template?uid=NQtE1jTzR4aDxJRJDJk-lQ)
* [Link Analysis](https://www.google.com/analytics/web/template?uid=zuSjXUnWQdapdeI9PuBqzA)
* [PPC Keywords](https://www.google.com/analytics/web/template?uid=M_0_ph04S9G2uTWfHSR7Og)
* [Site Speed by Landing Page](https://www.google.com/analytics/web/template?uid=huT4zYQDS2ybupEgmioPRA)
* [Social Media](https://www.google.com/analytics/web/template?uid=pAQryYV8Sz6z_MTuIVnDJQ)
* [SEO Dashboard](https://www.google.com/analytics/web/template?uid=DdK8j7mjQfqWjRRh27QHQQ)

* More at [customreportsharing.com](http://www.customreportsharing.com/)

#### How To Add?

* Login to Google Analytics
* Go back to this [page](https://github.com/johnantoni/dotfiles#google-analytics)
* Click one of the links above, you'll be redirected to your Google Analytics account where it will prompt you for the account to attach the report to.
