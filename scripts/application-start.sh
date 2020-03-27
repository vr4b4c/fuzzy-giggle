#!/usr/bin/env bash

set -ex

# why not picked up from $HOME/.bashrc?
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

cd $HOME/www/code-deploy-test/current

RAILS_ENV=production bundle exec rails s -p 3000 -d
