#!/bin/sh
# ** AUTO GENERATED **

# 1.1.14 - Ensure /var/tmp partition includes the nosuid option (Scored)

output=$(findmnt -n /var/tmp | grep -Ev '\bnosuid\b')

if [[ -n $output ]]; then
    exit 1
else
	exit 0
fi
