#!/bin/bash
# ** AUTO GENERATED **

# 1.8.4 - Ensure XDCMP is not enabled (Scored)


# Check if the configuration for enabling XDCMP exists
if grep -Eis '^\s*Enable\s*=\s*true' /etc/gdm/custom.conf &> /dev/null; then
    exit 1
else
    exit 0
fi

