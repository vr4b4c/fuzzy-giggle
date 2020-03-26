#!/usr/bin/env bash

set -ex

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export RAILS_ENV=production

rbenv shell 2.6.1

bundle install

ln -s $HOME/www/code-deploy-test/shared/config/master.key config/master.key

bundle exec rake db:migrate
bundle exec rake assets:precompile
