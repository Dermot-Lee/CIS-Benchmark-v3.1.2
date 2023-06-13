#!/bin/bash
# ** AUTO GENERATED **

# 3.5.3.3.6 - Ensure ip6tables is enabled and running (Not Scored)

# Check if ip6tables is enabled
if ! systemctl is-enabled ip6tables --quiet; then
    exit 1
fi

# Check if ip6tables service is active and running or exited
if ! systemctl status ip6tables | grep -E "Active: active \((running|exited)\)" --quiet; then
    exit 1
fi

# If all the checks pass, exit with 0
exit 0

