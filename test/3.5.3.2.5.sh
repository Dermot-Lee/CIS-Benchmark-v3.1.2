#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.2.5 - Ensure iptables rules are saved (Not Scored)

#!/bin/bash

# Save current iptables rules to a temporary file
iptables-save > /tmp/current_rules

# Compare current rules with rules in /etc/sysconfig/iptables
diff /tmp/current_rules /etc/sysconfig/iptables > /dev/null 2>&1
diff_result=$?

# Remove temporary file
rm /tmp/current_rules

# Check if the rules are the same
if [[ $diff_result -ne 0 ]]; then
    exit 1
fi

# Check if iptables is enabled to start at boot
enabled=$(systemctl is-enabled iptables)

# Check if iptables is set to start at boot
if [[ "$enabled" != "enabled" ]]; then
    exit 1
fi

# If the script has not exited by this point, both conditions are satisfied
exit 0
