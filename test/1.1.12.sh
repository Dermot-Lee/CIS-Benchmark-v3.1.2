#!/bin/bash
# ** AUTO GENERATED **

# 1.1.12 - Ensure /var/tmp partition includes the noexec option (Scored)

output=$(findmnt -n /var/tmp | grep -Ev '\bnoexec\b')

if [[ -n $output ]]; then
    exit 1
else
	exit 0
fi
