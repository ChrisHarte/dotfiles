## Setup RBENV

### RBENV on Ubuntu 12.04

    sudo aptitude install libreadline-dev zlib1g-dev openssl libssl0.9.8 libssl-dev

    git clone git@github.com:sstephenson/rbenv.git ~/.rbenv

    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

    which openssl
    => /usr/bin/openssl

### Install Ruby with OPENSSL (OSX BREW)

    CONFIGURE_OPTS=--with-openssl-dir=/usr/bin rbenv install 2.0.0-p0

    rbenv global 2.0.0-p0

### Install Ruby with OPENSSL, READLINE and INSTALL (OSX MACPORTS)

    sudo port install readline openssl

    CONFIGURE_OPTS="--disable-install-doc --with-openssl --with-readline-dir=/opt/local --with-libyaml --with-openssl-dir=/opt/local --with-opt-dir=/opt/local" rbenv install 1.9.3-p194

### List Ruby versions available

    rbenv install -l

### Set Global

    rbenv global 1.9.3-p194
    
### Set Local (creating per-project .rbenv-version file)

    rbenv local 1.9.3-p194

## Troubleshooting RBENV

### Error installing debugger-linecache in Ruby 1.9.3

    bundle update debugger-linecache
    bundle install

### Error installing ruby debugger

    gem install debugger
    rbenv rehash
    bundle install
