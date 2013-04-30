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

4) setup

    cd ~/.dotfiles
    rake

5) install vundle + plugins

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall

## Development

### Install Command-T (vim)

first install command-t plugin, then:

    cd ~/.vim/bundle/command-t/ruby/command-t
    rbenv local system
    ruby extconf.rb
    make && sudo make install

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

### Bundler params for specific gems

Edit your bundler config:

    vim ~/.bundle/config

My standard is:

    ---
      BUNDLE_PATH: vendor/bundle

This basically means that gems will be kept separately in a gemset for each project via the vendor/bundle directory, so not polluting the global gem set.

Problem is our gem 'geoip-c' needs specific params to install correctly, so for this we add:

      BUNDLE_BUILD__GEOIP-C: --with-geoip-dir=/opt/local

Build with "bundle install" and we're done, this will apply the above to the geoip-c gem ala:

      BUNDLE_BUILD__[gem name in uppercase]: --[params]

You could also store a separate bundler configuration file per-project.

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

## OSX Fixes (mountain lion)

### Use another mac as a second monitor (target display mode)

1. Connect your macbook to the external display (imac) via thunderbolt cable
2. On the iMac press Command+F2, this will reset the display and have the Macbook take over the iMac as a second monitor.

### ImageMagick Install on OSX (MiniMagick is recommended for rails)

    brew install imagemagick jpeg libtiff jasper

https://coderwall.com/p/wnomjg

### ImageMagick fix #1 for OSX

    cd /usr/local/Cellar/imagemagick/6.8.0-10/lib
    ln -s libMagick++-Q16.7.dylib   libMagick++.dylib
    ln -s libMagickCore-Q16.7.dylib libMagickCore.dylib
    ln -s libMagickWand-Q16.7.dylib libMagickWand.dylib

    brew uninstall libtool
    brew install --fresh libtool
    brew link libtool
    brew cleanup

### ImageMagick fix #2 for OSX

    brew uninstall imagemagick
    brew cleanup --force -s
    brew install imagemagick

## Ubuntu 12.04 Fixes

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

## Extras

### Self-hosted GIT via gitolite

http://www.bigfastblog.com/gitolite-installation-step-by-step

### NGINX start/stop/etc

    sudo service nginx restart

    Usage: nginx {start|stop|restart|reload|force-reload|status|configtest}

### Port forward 80 to 3000

    sudo iptables -t nat -A OUTPUT -p tcp --dport 80 -d 127.0.0.1/8 -j REDIRECT --to-port 3000

To set this up so it's done automatically on boot,

1)  Backup your current port rules

    sudo sh -c '/sbin/iptables-save > /etc/iptables.save'

2)  Create a new iptables file

    sudo vim /etc/iptables.up.rules

3)  Copy & paste this into the file

    *nat
    -A OUTPUT -p tcp --dport 80 -d 127.0.0.1/8 -j REDIRECT --to-port 3000
    COMMIT

4) Flush your current settings

    sudo /sbin/iptables -F

5) Import your new settings

    sudo /sbin/iptables-restore < /etc/iptables.up.rules

6) Check

    sudo /sbin/iptables -L

7) Now to make linux to use it on-boot do

    sudo vim /etc/network/if-pre-up.d/iptables

8) Copy and paste contents below into the file

    #!/bin/sh
    /sbin/iptables-restore < /etc/iptables.up.rules

9) Save it, then make it executable

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

### time [command]

you can do 'time [command]' to measure the time it take to run something

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

### CSS Links

* http://cssarrowplease.com/

## MongoDB

### Backup

    mongodump --host stark.mongohq.com --port 10011 --username tony --password notpassword1 --db mark1_db --out dumpdir

### Restore

    mongorestore --host stark.mongohq --port 10011 --username tony --password notpassword1 --db mark1_db dumpdir

Or

    mongorestore --db local_db --drop dump/local_db

When specifying --db and without --collection (restoring a whole database): - the given path must be a directory path - the directory must not contain any other files than .bson or .json

### Start Mongo locally

    mongod run --dbpath ~/.dotfiles/local_db --bind_ip 127.0.0.1 --rest

### Example Rails mongoid.yml

    defaults: &defaults
      host: localhost
      identity_map_enabled: true

    development:
      <<: *defaults
      database: dev_db
      port: 27017

    test:
      <<: *defaults
      database: test_db
      port: 27017

    production:
      <<: *defaults
      host: <%= ENV['MONGOID_HOST'] %>
      port: <%= ENV['MONGOID_PORT'] %>
      username: <%= ENV['MONGOID_USERNAME'] %>
      password: <%= ENV['MONGOID_PASSWORD'] %>
      database: <%= ENV['MONGOID_DATABASE'] %>
      # uri: 'mongodb://tony:notpassword1@stark.mongohq.com:10011/prod_db'

### Shell

#### open shell (default port 27017)

    mongo

#### help

    help

#### list databases

    show dbs

#### connect to / create database

    use db [name]

If you connect to a database that doesn't exist then one will be temporarily created, but it won't be saved to till you write something in it.

#### add user to database

    db.addUser('username','password')

## Database Backup via S3

### Setup Backup

    gem install backup
    rehash

    backup generate:model -t mydb --databases=mongodb --compressors=gzip --storages=s3

    backup perform --trigger mydb

### Make it Routine

Setup routine backups via the Whenever gem

https://github.com/meskyanichi/backup/wiki/automatic-backups

    mkdir config

    gem install whenever
    rehash

    wheneverize

Open the config/schedule.rb file and add the following:

    every 1.day, :at => '4:30 am' do
      command "backup perform -t mydb"
    end

Check what will be written to the crontab

    whenever

Update the crontab

    whenever --update-crontab

## Postgres

### Backup

via Linux

    pg_dump -Fc --no-acl --no-owner -h localhost -U [username] mydb > dump.sql

via OSX & http://postgresapp.com/

    /Applications/Postgres.app/Contents/MacOS/bin/pg_dump -Fc --no-acl --no-owner -h localhost -U [username] mydb > dump.sql

### Restore

    pg_restore --verbose --clean --no-acl --no-owner -h localhost -U [username] -d mydb dump.sql

or

    pg_restore --verbose --clean --no-acl --no-owner -h localhost -U [username] --port 5432 -d mydb dump.sql

via OSX & http://postgresapp.com/

    /Applications/Postgres.app/Contents/MacOS/bin/pg_restore --verbose --clean --no-acl --no-owner -h localhost -U [username] -d mydb dump.sql

### Login

for postgres.app

    psql -h localhost

or

    psql -h localhost --port 5432 -U postgres

### Permissions

    CREATE USER tony WITH PASSWORD 'password';

    ALTER USER tony WITH SUPERUSER;

    CREATE DATABASE mark1;

    GRANT ALL PRIVILEGES ON DATABASE mark1 to tony;

    \q

### MacPorts start / stop

    sudo port load postgresql92-server

    sudo port unload postgresql92-server

alias added for this

   portsql [unload/load]

# GIT

## TIG (text-mode interface for git)

    brew install tig

https://github.com/jonas/tig

## Rebase

Filters are included to help with rebasing using http://technosorcery.net/blog/2010/02/07/fun-with-the-upcoming-1-7-release-of-git-rebase---interactive---autosquash/

Basically for any commit you are doing that you know you will want to squash, put 'squash!' at the beginning of the commit.

Now when you go to rebase,

    git ri <branch-name>

It will use those comments to mark them as 'squash'able automatically, any others will be marked with pick as usual.

Note, if you exit out of the editor (in this case vim) without saving git will still try to perform the rebase to revert this do:

    git reset --soft

You'll now be ready to redo the rebase.

### Abort

If you screw up the rebase and need to abort the rebase do:

    git rebase --abort

### play-by-play

When you do do a rebase, here's how it goes:

1. First you perform the rebase, specifying the ref and branch.

    **git ri origin/master** or **git rebase origin/master --interactive**

2. Next git will open your editor of choice specified from .gitconfig, in this vim
3. You will now see a list of your local commits, in ascending order (first to last).
4. All will be marked with the 'pick' command, change as appropriate.
6. Save and quit ":wq!"
7. VIM will re-open and you'll now see all the commit messages from the squashed commits.
8. Save and quit again ":wq!"
9. You should finally see this message confirming the rebase has gone correctly,

    **Successfully rebased and updated refs/heads/master.**

10. You still need to push your changes

    **git push origin master**

Note: because of the [default=nothing] setting in .gitconfig, you will always have to specify the ref to push with rather than use the default. it's safer this way http://technosorcery.net/blog/2011/12/15/making-git-push-a-little-smarter-slash-safer/

### rebase commands

    p, pick = use commit
    r, reword = use commit, but edit the commit message
    e, edit = use commit, but stop for amending
    s, squash = use commit, but meld into previous commit
    f, fixup = like "squash", but discard this commit's log message
    x, exec = run command (the rest of the line) using shell

## Notes

### git r
show current branch history

### git ra
show all history

### git push --set-upstream origin <branch-name>
*--set-upstream* sets what ref we'll be pushing to so we don't have to specify every time.
This won't have any effect as we've used [default=nothing] in our .gitconfig so we'll have to specify the ref on each push.

### git pull --rebase
Doing 'git pull' is fine but if you're working on a branch others are actively using this will add a merge message to the log messing up the log history. Using --rebase will do a pull then rebase and keep the log clean.

### git stash
Stash your un-committed changes

### git stash pop
Restore your stashed changes

### git stash list
List all stashed changes

### git stash pop[1]
Restore stashed change at location 1

### git merge --ff-only
Refuse to merge and exit with a non-zero status unless the current HEAD is already up-to-date or the merge can be resolved as a fast-forward.

### git branch -d <branch-name>
Delete local branch

### git push origin --delete <branch-name>
Delete remote branch

### git ri <branch-name>
Start interactive rebase

### git rebase --abort
Abort rebase

### git reset --soft
Does not touch the index file nor the working tree at all (but resets the head to <commit>, just like all modes do). This leaves all your changed files "Changes to be committed", as git status would put it.

### git reset --hard
Resets the index and working tree. Any changes to tracked files in the working tree since <commit> are discarded.

### git reset --hard HEAD~3
Rewind branch 3 commits back, destroying those commits

### git grep [search term]
Search committed code in a git repo http://stackoverflow.com/questions/2928584/how-to-grep-search-committed-code-in-the-git-history

### git blame [file]
See commit history for file.

### git branch -a
See both local and remote branches

### git branch -l
See local branches

### git branch -r
See remote branches

## Fetching remote branches

    git fetch origin [branch]
    git co [branch]

## Links

http://stackoverflow.com/questions/4114095/git-revert-to-previous-commit-how

# OSX

## Tips

### Take screenshots

    Command + Shift + 3  (full screen)
    Command + Shift + 4  (selective)

Install something like (Orbit)[http://orbitapp.net/] to send your screenshots automatically to the web.

### Take measurements

    Command + Shift + 4 then use the mouse to click-and-drag to see dimensions then ESC to avoid taking a screenshot.

# VIM

    v               visual mode
    Shift + V       visual line
        c           copy
        p           paste
        d           delete

    i               insert mode
    a               insert mode after cursor
    jj              exit insert mode

    ,h              search by filename (commandt)
    ,a              search by content (silver searcher)
    ,n              file tree (nerdtree)
    
    " + a + p       paste from top register (last copy/cut)
    :reg            show top 10 registers
    
    ctrl + l        goto end of line (insert mode)
    
    ctrl + h        goto left split
    ctrl + j        goto bottom split
    ctrl + k        goto top split
    ctrl + l        goto right split
    
