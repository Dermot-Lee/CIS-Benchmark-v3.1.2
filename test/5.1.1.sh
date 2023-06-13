#!/bin/sh
# ** AUTO GENERATED **

# 5.1.1 - Ensure cron daemon is enabled and running (Scored)

#!/bin/bash

if [[ $(systemctl is-enabled crond) == "enabled" ]] && $(systemctl status crond | grep -q 'Active: active (running) '); then
    exit 0
else
    exit 1
fi

