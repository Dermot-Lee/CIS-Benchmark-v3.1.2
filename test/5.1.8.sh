#!/bin/bash
# ** AUTO GENERATED **

# 5.1.8 - Ensure cron is restricted to authorized users (Scored)

# Check if /etc/cron.allow does not exist
if [ ! -e /etc/cron.allow ]; then
    exit 1
fi

# Check if /etc/cron.deny does not exist
if [ -e /etc/cron.deny ]; then
    exit 1
fi

# Check if /etc/cron.allow has correct owner and permissions
if [ "$(stat -c "%U%G%a" /etc/cron.allow)" == "rootroot600" ]; then
    exit 0
fi

exit 1


