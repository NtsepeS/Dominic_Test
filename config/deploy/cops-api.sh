#!/bin/sh

export DATABASE_URL="postgresql://postgres@${POSTGRES_PORT_5432_TCP_ADDR}:${POSTGRES_PORT_5432_TCP_PORT}/cops-api?pool=5"

cd /srv/cops-api

/sbin/setuser cops-api bundle exec rake db:create
/sbin/setuser cops-api bundle exec rake db:migrate

exec /sbin/setuser cops-api bundle exec \
      unicorn -p ${PORT} -c config/unicorn.rb \
          >> /var/log/rails.log 2>&1
