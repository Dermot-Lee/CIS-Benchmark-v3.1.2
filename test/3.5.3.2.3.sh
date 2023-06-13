#!/bin/bash
# ** AUTO GENERATED **

# 3.5.3.2.3 - Ensure iptables rules exist for all open ports (Not Scored)

# List all open ports
open_ports=$(netstat -tuln | awk '{print $4}' | cut -d: -f2 | tail -n +3)

# Check if there is a rule for each open port
for port in $open_ports; do
  rule_exists=$(iptables -L -n | grep $port)
  if [[ -z "$rule_exists" ]]; then
    exit 1
  fi
done

# Check if iptables is enabled to start at boot
enabled=$(systemctl is-enabled iptables)

# Check if iptables is set to start at boot
if [[ "$enabled" != "enabled" ]]; then
  exit 1
fi

# If the script has not exited by this point, both conditions are satisfied
exit 0

