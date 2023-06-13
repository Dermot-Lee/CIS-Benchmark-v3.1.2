#!/bin/bash
# ** AUTO GENERATED **

# 5.3.5 - Ensure SSH LogLevel is appropriate (Scored)

# Step 1
output1=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep loglevel)

if [[ $output1 == *"loglevel VERBOSE"* ]] || [[ $output1 == *"loglevel INFO"* ]]; then
    # Step 2
    output2=$(grep -i 'loglevel' /etc/ssh/sshd_config | grep -Evi '(VERBOSE|INFO)')

    if [[ -z $output2 ]]; then
        exit 0
    else
        exit 1
    fi
else
    exit 1
fi



