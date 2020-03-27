#!/usr/bin/env bash

set -ex

PIDFILE=tmp/pids/server.pid

if [ -f "$PIDFILE" ]; then
  kill -SIGINT `cat $PIDFILE`
fi
