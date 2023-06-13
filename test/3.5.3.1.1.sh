#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.1.1 - Ensure iptables packages are installed (Not Scored)

output=$(rpm -q iptables iptables-services)

if [[ $output == *"iptables-"* ]] && [[ $output == *"iptables-services-"* ]]; then
    exit 0
else
    exit 1
fi
