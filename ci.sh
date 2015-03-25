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

# Root directory npm install
npm install
npm prune

silently cd rails
bundle install

silently cd ../ember
npm install
npm prune
bower install
bower prune

silently  cd ../cukes
bundle install

# ember tests

silently cd ../ember
npm test

# rails tests

silently  cd ../rails

bundle exec rake db:drop db:create db:migrate db:test:prepare
bundle exec rake ci:setup:rspec spec

# cucumber tests

silently cd ../cukes
cucumber --tags ~@wip --format json -o cucumber.json
