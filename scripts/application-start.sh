#!/usr/bin/env bash

set -ex

RAILS_ENV=production rails s -p 80 -d
