#!/bin/bash
# ** AUTO GENERATED **

# 5.3.19 - Ensure SSH PAM is enabled (Scored)

# Step 1
output1=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i usepam)

if [[ $output1 != "usepam yes" ]]; then
    exit 1
fi

# Step 2
output2=$(grep -Ei '^\s*UsePAM\s+no' /etc/ssh/sshd_config)

if [[ -n $output2 ]]; then
    exit 1
else
    exit 0
fi

