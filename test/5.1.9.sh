#!/bin/bash
# ** AUTO GENERATED **

# 5.1.9 - Ensure at is restricted to authorized users (Scored)

# Check if /etc/at.allow does not exist
if [ ! -e /etc/at.allow ]; then
    exit 1
fi

# Check if /etc/cron.deny does not exist
if [ -e /etc/at.deny ]; then
    exit 1
fi

# Check if /etc/at.allow has correct owner and permissions
if [ "$(stat -c "%U%G%a" /etc/at.allow)" == "rootroot600" ]; then
    exit 0
fi

exit 1

