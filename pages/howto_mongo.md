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

### Start Mongo on bootup (ubuntu)

    sudo update-rc.d mongodb defaults

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

