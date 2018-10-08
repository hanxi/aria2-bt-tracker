#!/bin/sh

# 启动 crontab
exec crond -l 2 -f "$@"

