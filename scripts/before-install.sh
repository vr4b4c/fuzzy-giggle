#!/usr/bin/env bash

set -ex

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export RAILS_ENV=production

cd /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive

bundle install

ln -nfs $HOME/www/code-deploy-test/shared/config/master.key config/master.key

bundle exec rake db:migrate
bundle exec rake assets:precompile
