#!/bin/sh
# ** AUTO GENERATED **

# 4.2.1.1 - Ensure rsyslog is installed (Scored)

output=$(rpm -q rsyslog)

if [[ $output == *"rsyslog-"* ]]; then
    exit 0
else
    exit 1
fi
