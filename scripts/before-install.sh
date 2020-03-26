#!/usr/bin/env bash

set -ex

export RAILS_ENV=production

bundle install

ln -s ../shared/config/master.key config/master.key

bundle exec rake db:migrate
bundle exec rake assets:precompile
