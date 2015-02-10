#!/bin/bash --login
set -e
rvm use "2.2.0"
# Set this for after rvm is done loading, to keep CI output low
set -x

cd rails

export RAILS_ENV=test

bundle install
bundle exec rake db:create:all
bundle exec rake db:migrate
bundle exec rake db:test:prepare
echo "Test"
