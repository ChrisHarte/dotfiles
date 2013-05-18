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
