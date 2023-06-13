#!/bin/bash
# ** AUTO GENERATED **

# 4.2.2.1 - Ensure journald is configured to send logs to rsyslog (Scored)

if grep -q "^ForwardToSyslog=yes" /etc/systemd/journald.conf; then
    exit 0
else
    exit 1
fi

