#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.6 - Ensure network interfaces are assigned to appropriate zone (Not Scored)

output=$(find /sys/class/net/* -maxdepth 1 | awk -F"/" '{print $NF}' | while read -r netint; do [ "$netint" != "lo" ] && firewall-cmd --get-active-zones | grep -B1 $netint; done)

if [[ $output == *"public"* ]] && [[ $output == *"ens"* ]]; then
    exit 0
else
    exit 1
fi