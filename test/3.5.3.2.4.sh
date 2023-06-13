#!/bin/bash
# ** AUTO GENERATED **

# 3.5.3.2.4 - Ensure iptables default deny firewall policy (Not Scored)

# Commands to check default policies
input_policy=$(iptables -L INPUT -n | head -n 1 | grep 'DROP\|REJECT')
output_policy=$(iptables -L OUTPUT -n | head -n 1 | grep 'DROP\|REJECT')
forward_policy=$(iptables -L FORWARD -n | head -n 1 | grep 'DROP\|REJECT')

# Check if the default policies are DROP or REJECT
if [[ -z "$input_policy" ]] || [[ -z "$output_policy" ]] || [[ -z "$forward_policy" ]]; then
    exit 1
fi

# Command to check if iptables is enabled to start at boot
enabled=$(systemctl is-enabled iptables)

# Check if iptables is set to start at boot
if [[ "$enabled" != "enabled" ]]; then
    exit 1
fi

# If the script has not exited by this point, both conditions are satisfied
exit 0
