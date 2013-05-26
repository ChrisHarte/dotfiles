do this

https://github.com/sunspot/sunspot/wiki/Configure-Solr-on-Ubuntu%2C-the-quickest-way

    sudo apt-get install openjdk-6-jdk
    sudo apt-get install solr-tomcat

then copy your dev copy of schema.xml over to /usr/share/solr/

    sudo rm /usr/share/solr/conf/schema.xml
    sudo cp schema.xml /usr/share/solr/conf

why? because the standard version of solr knows nothing about rails scoped magic

now start tomcat

    sudo service tomcat6 start

it will be running on www.mysite.com:8080/solr ,navigate and check it's working in your browser

now index your schema

    sudo -p 'sudo password: ' su - [username] -c 'cd /home/myapp/app && ./bin/rake sunspot:reindex'

and your good!

.....

use this for your production sunspot.yml

    production:
      solr:
        hostname: localhost
        port: 8080
        log_level: WARNING
        auto_commit_after_request: false
        path: '/solr'
