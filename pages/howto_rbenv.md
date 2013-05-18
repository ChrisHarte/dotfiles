### RBENV on Ubuntu 12.04

    sudo aptitude install libreadline-dev zlib1g-dev openssl libssl0.9.8 libssl-dev

    git clone git@github.com:sstephenson/rbenv.git ~/.rbenv

    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

    which openssl
    => /usr/bin/openssl

### List Ruby versions available

    rbenv install -l

### Install Ruby with OPENSSL

    CONFIGURE_OPTS=--with-openssl-dir=/usr/bin rbenv install 2.0.0-p0

    rbenv global 2.0.0-p0

### Error installing debugger-linecache in Ruby 1.9.3

    bundle update debugger-linecache
    bundle install

### Error installing ruby debugger

    gem install debugger
    rbenv rehash
    bundle install
