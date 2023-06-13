#!/bin/bash
# ** AUTO GENERATED **

# 3.5.3.2.6 - Ensure iptables is enabled and running (Not Scored)

# Check if iptables is enabled
enabled=$(systemctl is-enabled iptables)
if [[ "$enabled" != "enabled" ]]; then
    exit 1
fi

# Check if iptables is active and running or exited
status=$(systemctl status iptables | grep -E "Active: active \((running|exited)\)")
if [[ -z "$status" ]]; then
    exit 1
fi

# If the script has not exited by this point, both conditions are satisfied
exit 0

