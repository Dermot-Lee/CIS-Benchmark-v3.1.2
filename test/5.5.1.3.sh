#!/bin/bash
# ** AUTO GENERATED **

# 5.5.1.3 - Ensure password expiration warning days is 7 or more (Not Scored)

# Step 1
output1=$(grep ^\s*PASS_WARN_AGE /etc/login.defs)

# Validate output1. Here, we need to parse the output and check the numeric value
pass_warn_age=$(echo $output1 | awk '{print $2}')

if [[ $pass_warn_age -lt 7 ]]; then
    exit 1
fi

# Step 2
users=$(grep -E ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1,6)

while IFS=: read -r user pass_warn_age; do
    if [[ $pass_warn_age -lt 7 ]]; then
        exit 1
    fi
done <<< "$users"

exit 0

