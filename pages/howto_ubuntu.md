## Ubuntu 12.04

### Set Locale 

on Ubuntu

    sudo apt-get install language-pack-en-base
    sudo dpkg-reconfigure locales

on Debian

    sudo locale-gen

### Add Linux user to Group (ubuntu/debian)

    usermod -a -G [group] [username]

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

### ATI 7700 (multi-monitor setup)

1) Update to the latest kernel then goto Additional Drivers, install the ATI Recommended driver, with both monitors plugged in (hdmi to 1, displayport to 2).

2) You may need to increase the overscan for the hdmi as there may be a black border round the screen, open AMD Catalyst Center and enable manual overscan then increase till screen fills entirely.

3) Now to enable the Multi-Monitor feature you will have to run the Catalyst Control center in Administrator mode, via:

    sudo amdcccle

4) Now "Display Manager", "Multi-Display" and select "Multi-display desktop with display(s) 2"

5) Apply and you should be done.

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
