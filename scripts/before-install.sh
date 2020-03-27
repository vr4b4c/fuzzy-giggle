#!/usr/bin/env bash

set -ex

# why not picked up from $HOME/.bashrc?
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export RAILS_ENV=production

# feels wierd to cd into app directory, otherwise it seems like running from /opt/codedeploy-agent
cd /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive

bundle install

# by default, files are owned by the root:root (wierd again)
sudo chown -R ubuntu:ubuntu .

ln -nfs $HOME/www/code-deploy-test/shared/config/master.key config/master.key

bundle exec rake db:migrate
bundle exec rake assets:precompile
