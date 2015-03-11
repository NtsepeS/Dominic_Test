#!/bin/bash --login

# to keep CI output low
function silently {
	set +x 
	"$@" 
	set -x
}

silently rvm use "2.2.0"

# env

export RAILS_ENV=test
export BROWSER=poltergeist

# install all the things

silently cd rails
bundle install

silently cd ../ember
npm install
bower install

silently  cd ../cukes
bundle install

# rails tests

silently  cd ../rails

bundle exec rake db:drop db:create db:migrate db:test:prepare
bundle exec rake ci:setup:rspec spec

# cucumber tests

silently cd ../cukes

cucumber --format json -o cucumber.json
