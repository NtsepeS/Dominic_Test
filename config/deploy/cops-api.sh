#!/bin/sh

export DATABASE_URL="postgresql://postgres@${DB_HOST}:5432/${DB_DB}?pool=5"

cd /srv/cops-api

/sbin/setuser cops-api bundle exec rake db:create
/sbin/setuser cops-api bundle exec rake db:migrate

exec /sbin/setuser cops-api bundle exec \
      puma start -C config/puma.rb \
          >> /var/log/rails.log 2>&1
