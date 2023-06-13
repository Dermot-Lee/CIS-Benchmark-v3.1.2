#!/bin/sh
# ** AUTO GENERATED **

# 1.1.13 - Ensure /var/tmp partition includes the nodev option (Scored)

output=$(findmnt -n /var/tmp | grep -Ev '\bnodev\b')

if [[ -n $output ]]; then
    exit 1
else
	exit 0
fi
