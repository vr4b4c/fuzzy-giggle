#!/usr/bin/env bash

set -ex

RAILS_ENV=production bundle exec rails s -p 3000 -d
