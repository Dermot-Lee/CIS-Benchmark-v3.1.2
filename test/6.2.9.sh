#!/bin/sh
# ** AUTO GENERATED **

# 6.2.9 - Ensure root is the only UID 0 account (Scored)

output=$(awk -F: '($3 == 0) { print $1 }' /etc/passwd)

if [[ $output != "root" ]]; then
    exit 1
else
	exit 0
fi
