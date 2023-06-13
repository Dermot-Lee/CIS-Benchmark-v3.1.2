#!/bin/bash
# ** AUTO GENERATED **

# 3.5.3.3.4 - Ensure ip6tables default deny firewall policy (Not Scored)

# Define the chains
chains=("INPUT" "OUTPUT" "FORWARD")

# Loop over the chains
for chain in "${chains[@]}"; do
    # Get the policy for this chain
    policy=$(ip6tables -L $chain -n | head -n 1 | awk '{print $4}')

    # Check if the policy is DROP or REJECT
    if [[ "$policy" != "DROP" && "$policy" != "REJECT" ]]; then
        exit 1
    fi
done

# If all the checks pass, exit with 0
exit 0

