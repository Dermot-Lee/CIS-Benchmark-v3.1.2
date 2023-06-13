#!/bin/bash
# ** AUTO GENERATED **

# 5.3.21 - Ensure SSH MaxStartups is configured (Scored)

# Step 1
output1=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxstartups)

# Validate output1. Here, we need to parse the output and check the numeric values
parsed_output1=$(echo $output1 | awk '{split($0,a,":"); print a[1], a[2], a[3]}')
start_val=$(echo $parsed_output1 | awk '{print $2}')
rate_val=$(echo $parsed_output1 | awk '{print $3}')
max_val=$(echo $parsed_output1 | awk '{print $4}')

if [[ $start_val -lt 10 ]] || [[ $rate_val -lt 30 ]] || [[ $max_val -lt 60 ]]; then
    exit 1
fi

# Step 2
output2=$(grep -Ei '^\s*maxstartups\s+(((1[1-9]|[1-9][0-9][0-9]+):([0-9]+):([0-9]+))|(([0-9]+):(3[1-9]|[4-9][0-9]|[1-9][0-9][0-9]+):([0-9]+))|(([0-9]+):([0-9]+):(6[1-9]|[7-9][0-9]|[1-9][0-9][0-9]+)))' /etc/ssh/sshd_config)

if [[ -n $output2 ]]; then
    exit 1
else
    exit 0
fi


