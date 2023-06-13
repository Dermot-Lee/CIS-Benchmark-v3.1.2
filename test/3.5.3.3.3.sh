#!/bin/bash
# ** AUTO GENERATED **

# 3.5.3 - Ensure ip6tables firewall rules exist for all open ports (Not Scored)

# Get all open ports
open_ports=$(ss -6tuln | awk 'NR>1 {print $5}' | cut -d':' -f2)

# Loop over all open ports
for port in $open_ports; do
    # Check if there is a rule in the INPUT chain for this port
    if ! ip6tables -L INPUT -v -n | grep --quiet "$port"; then
        exit 1
    fi
done

# If all the checks pass, exit with 0
exit 0

