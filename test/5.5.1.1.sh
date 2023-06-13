#!/bin/bash
# ** AUTO GENERATED **

# 5.5.1.1 -  Ensure password expiration is 365 days or less (Not Scored)

# Step 1
output1=$(grep ^\s*PASS_MAX_DAYS /etc/login.defs)

# Validate output1. Here, we need to parse the output and check the numeric value
pass_max_days=$(echo $output1 | awk '{print $2}')

if [[ $pass_max_days -gt 365 ]]; then
    exit 1
fi

# Step 2
users=$(grep -E '^[^:]+:[^!*]' /etc/shadow | cut -d: -f1,5)

while IFS=: read -r user pass_max_days; do
    if [[ $pass_max_days -gt 365 ]]; then
        exit 1
    fi
done <<< "$users"

exit 0

