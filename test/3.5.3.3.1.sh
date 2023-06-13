#!/bin/bash
# ** AUTO GENERATED **

# 3.5.3.3.1 - Ensure ip6tables loopback traffic is configured (Not Scored)

# Define the expected rules
expected_rules=(
    "-A INPUT -i lo -j ACCEPT"
    "-A OUTPUT -o lo -j ACCEPT"
    "-A INPUT -s ::1 -j DROP"
)

# Loop over the expected rules
for rule in "${expected_rules[@]}"; do
    # Check if the rule exists in the INPUT chain
    if ! ip6tables -L INPUT -v -n | grep --quiet "$rule"; then
        exit 1
    fi
    # Check if the rule exists in the OUTPUT chain
    if ! ip6tables -L OUTPUT -v -n | grep --quiet "$rule"; then
        exit 1
    fi
done

# If all the checks pass, exit with 0
exit 0

