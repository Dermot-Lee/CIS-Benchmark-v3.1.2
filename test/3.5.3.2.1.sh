#!/bin/bash
# ** AUTO GENERATED **

# 3.5.3.2.1 - Ensure iptables loopback traffic is configured (Not Scored)


# Commands to check for loopback traffic rules
input=$(iptables -L INPUT -v -n | grep 'lo' | grep 'ACCEPT')
output=$(iptables -L OUTPUT -v -n | grep 'lo' | grep 'ACCEPT')
drop=$(iptables -L INPUT -v -n | grep '127.0.0.0/8' | grep 'DROP')

# Check if the rules are present
if [[ -z "$input" ]] || [[ -z "$output" ]] || [[ -z "$drop" ]]; then
    echo "Loopback traffic not correctly configured."
    exit 1
fi

# Command to check if iptables is enabled to start at boot
enabled=$(systemctl is-enabled iptables)

# Check if iptables is set to start at boot
if [[ "$enabled" != "enabled" ]]; then
    echo "Iptables not set to start at boot."
    exit 1
fi

# If the script has not exited by this point, both conditions are satisfied
echo "Loopback traffic is configured and iptables is set to start at boot."
exit 0
