#!/bin/bash
# ** AUTO GENERATED **

# 5.5.1.4 - Ensure system accounts are secured (Not Scored)

# Step 1
output1=$(useradd -D | grep INACTIVE)

# Validate output1. Here, we need to parse the output and check the numeric value
inactive=$(echo $output1 | awk -F= '{print $2}')

if [[ $inactive -gt 30 ]]; then
    exit 1
fi

# Step 2
users=$(grep -E ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1,7)

while IFS=: read -r user inactive; do
    if [[ $inactive -gt 30 ]]; then
        exit 1
    fi
done <<< "$users"

exit 0

