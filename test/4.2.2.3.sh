#!/bin/sh
# ** AUTO GENERATED **

# 4.2.2.3 - Ensure journald is configured to write logfiles to persistent disk (Scored)

if grep -q "^Storage=persistent" /etc/systemd/journald.conf; then
    exit 0
else
    exit 1
fi
