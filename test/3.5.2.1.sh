#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.1 -  Ensure nftables is installed (Not Scored)

output=$(rpm -q nftables)

if [[ $output == *"nftables-"* ]]; then
    exit 0
else
    exit 1
fi
