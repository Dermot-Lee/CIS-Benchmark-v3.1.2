#!/bin/sh
# ** AUTO GENERATED **

# 1.1.11 - Ensure separate partition exists for /var/log (Scored)

output=$(findmnt -n /tmp -n | grep -Ev '\bnosuid\b')

if [[ -n $output ]]; then
    exit 1
else
	exit 0
fi
