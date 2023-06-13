#!/bin/bash
# ** AUTO GENERATED **

# 5.3.7 - Ensure SSH MaxAuthTries is set to 4 or less (Scored)

# Step 1
output1=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep maxauthtries)

if [[ -z $output1 ]]; then
    exit 1
fi

max_auth_tries=$(echo $output1 | awk '{print $2}')

if (( max_auth_tries <= 4 )); then
    # Step 2
    output2=$(grep -Ei '^\s*maxauthtries\s+([5-9]|[1-9][0-9]+)' /etc/ssh/sshd_config)

    if [[ -z $output2 ]]; then
        exit 0
    else
        exit 1
    fi
else
    exit 1
fi

