#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.1 - Ensure firewalld is installed (Not Scored)

output=$(rpm -q firewalld iptables)

if [[ $output == *"firewalld-"* ]] && [[ $output == *"iptables-"* ]]; then
    exit 0
else
    exit 1
fi

