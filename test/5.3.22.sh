#!/bin/bash
# ** AUTO GENERATED **

# 5.3.22 -  Ensure SSH MaxSessions is limited (Scored)

# Step 1
output1=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxsessions)

if [[ -z $output1 ]]; then
    exit 1
fi

max_auth_tries=$(echo $output1 | awk '{print $2}')

if (( max_auth_tries <= 10 )); then
    # Step 2
    output2=$(grep -Ei '^\s*MaxSessions\s+(1[1-9]|[2-9][0-9]|[1-9][0-9][0-9]+)' /etc/ssh/sshd_config)

    if [[ -z $output2 ]]; then
        exit 0
    else
        exit 1
    fi
else
    exit 1
fi

