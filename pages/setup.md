## Development

### VIM with Ruby support

    sudo apt-get install vim-nox


if you get an error regarding mkmf not found do:

    sudo aptitude install ruby1.9.1-dev

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

## Extras

### PhantomJS

    brew update && brew install phantomjs

more [here](http://phantomjs.org/download.html)

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

### Install Libv8 on OSX 10.8

    RUBYOPT=-rrubygems bundle install

### Create Sublime Text command-line shortcut "subl ."

    ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/.dotfiles/bin/subl

### Example Rails Generator

    rails g controller api/ --skip-javascripts --skip-stylesheets --skip-helpers

### time [command]

you can do 'time [command]' to measure the time it take to run something

## Development Gotchas

* Always check for an MIT licence or some kind of ok before you pull in a new plugin.
* Log any new plugins with tech in case issues arise.
* Run js thru jslint to sanity check the code, missing ; or otherwise.
* Time box your work. If you can't solve it in 1 hour, spike it.
* Planning poker is king, estimate new work/features so there's less chance of overrunning on budget/estimates.

## Testing

    rake db:migrate         migrate database
    rake test:prepare       rebuild test database from scratch
    rake test               run all tests
    rake test:recent        run recently changed tests
    rake test:uncommitted   run any uncommitted tests (git or svn)

## HTML Problems to Watch For

* [http://html5doctor.com/legend-not-such-a-legend-anymore/](http://html5doctor.com/legend-not-such-a-legend-anymore/)

## CSS Links

* http://cssarrowplease.com/
