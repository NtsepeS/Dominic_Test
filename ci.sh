#!/bin/bash --login

cd rails

set -e
rvm use "2.1.2"
# Set this for after rvm is done loading, to keep CI output low
set -x

export RAILS_ENV=test

bundle install
bundle exec rake ci:setup:rspec spec
