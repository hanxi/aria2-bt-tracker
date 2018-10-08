#!/bin/sh

# start crontab
exec crond -l 2 -f "$@"

