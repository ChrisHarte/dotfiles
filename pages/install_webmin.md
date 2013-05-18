## deployer

    adduser deployer
    usermod -a -G sudo deployer

## initial packages

    su - deployer

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install build-essential nano openssh-client openssh-server lynx wget curl git-core subversion aptitude ruby1.9.3 vim-nox

## perl

    sudo apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python

## mysql

    sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql

## apache

    sudo apt-get install libapache2-mod-php5 php5 apache2

## webmin

    wget http://prdownloads.sourceforge.net/webadmin/webmin_1.630_all.deb
    sudo dpkg -i webmin_1.630_all.deb
    sudo usermod -a -G www-data deployer

## phpmyadmin

    sudo apt-get install phpmyadmin

## dns

    sudo apt-get install bind9 dnsutils

## reboot

    sudo shutdown -r now

## login

    webmin      myserver.com:10000
    phpmyadmin  myserver.com/phpmyadmin
