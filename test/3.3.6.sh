#!/bin/bash

# Check the current value
current_value=$(sysctl net.ipv4.icmp_ignore_bogus_error_responses | awk '{print $3}')
if [[ "$current_value" != "1" ]]; then
    exit 1
fi

# Check configuration files
grep_output=$(grep -r "net.ipv4.icmp_ignore_bogus_error_responses" /etc/sysctl.conf /etc/sysctl.d/ /usr/lib/sysctl.d/ /run/sysctl.d/ 2>/dev/null)
if [[ "$grep_output" != *"net.ipv4.icmp_ignore_bogus_error_responses = 1"* ]]; then
    exit 1
fi

# If the script hasn't exited by now, both conditions are satisfied
exit 0

