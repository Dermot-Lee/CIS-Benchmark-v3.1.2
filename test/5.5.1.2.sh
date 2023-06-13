#!/bin/bash
# ** AUTO GENERATED **

# 5.5.1.2 - Ensure minimum days between password changes is configured (Not Scored)

# Step 1
output1=$(grep ^\s*PASS_MIN_DAYS /etc/login.defs)

# Validate output1. Here, we need to parse the output and check the numeric value
pass_min_days=$(echo $output1 | awk '{print $2}')

if [[ $pass_min_days -lt 1 ]]; then
    exit 1
fi

# Step 2
users=$(grep -E ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1,4)

while IFS=: read -r user pass_min_days; do
    if [[ $pass_min_days -lt 1 ]]; then
        exit 1
    fi
done <<< "$users"

exit 0

