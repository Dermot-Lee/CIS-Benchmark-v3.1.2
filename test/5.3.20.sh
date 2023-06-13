#!/bin/bash
# ** AUTO GENERATED **

# 5.3.20 - Ensure SSH AllowTcpForwarding is disabled (Scored)

# Step 1
output1=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i allowtcpforwarding)

if [[ $output1 != "allowtcpforwarding no" ]]; then
    exit 1
fi

# Step 2
output2=$(grep -Ei '^\s*AllowTcpForwarding\s+yes' /etc/ssh/sshd_config)

if [[ -n $output2 ]]; then
    exit 1
else
    exit 0
fi

