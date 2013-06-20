## upstart

    [start][stop][restart][status] railsapp

### railsapp.conf + rbenv

    description "start railsapp"
    
    start on runlevel [2]
    stop on runlevel [016]
    
    console owner
    
    script
      APP_ROOT=/home/deployer/apps/railsapp
      PATH=/home/deployer/.rbenv/shims:/home/deployer/.rbenv/bin:$PATH
      $APP_ROOT/bin/unicorn -c $APP_ROOT/config/unicorn.rb -E production # >> /tmp/upstart.log 2>&1
    end script
