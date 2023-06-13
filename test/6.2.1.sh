#!/bin/bash
# ** AUTO GENERATED **

# 6.2.1 - Ensure accounts in /etc/passwd use shadowed passwords (Scored)

output=$(awk -F: '($2 != "x" ) { print $1 " is not set to shadowed passwords "}' /etc/passwd)

if [[ -n $output ]]; then
    exit 1
else
    exit 0
fi
