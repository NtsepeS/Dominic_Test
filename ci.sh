#!/bin/bash --login
set -e
rvm use "2.2.0"
# Set this for after rvm is done loading, to keep CI output low
set -x

cd rails

export RAILS_ENV=test

bundle install
rake db:create
bundle exec rake ci:setup:rspec spec
rake db:drop
echo "Test"
