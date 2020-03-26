#!/usr/bin/env bash

set -ex

kill -SIGINT `cat tmp/pids/server.pid`
