#!/bin/bash --login
set -e
rvm use "2.2.0"
# Set this for after rvm is done loading, to keep CI output low
set -x

# env

export RAILS_ENV=test

# install all the things

cd rails && bundle install && cd -
cd ember
npm install -g bower
npm install
bower install
cd -
cd cukes && bundle install && cd -

# rails tests

cd rails

export RAILS_ENV=test
bundle install
bundle exec rake db:drop db:create db:migrate db:test:prepare
bundle exec rake ci:setup:rspec spec

cd ..

# cucumber tests

cd cukes

bundle install
cucumber --format json -o cucumber.json

cd ..
