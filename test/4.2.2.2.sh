#!/bin/bash
# ** AUTO GENERATED **

# 4.2.2.2 -  Ensure journald is configured to compress large log files (Not Scored)

if grep -q "^Compress=yes" /etc/systemd/journald.conf; then
    exit 0
else
    exit 1
fi

