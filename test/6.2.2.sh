#!/bin/sh
# ** AUTO GENERATED **

# 6.2.2 - Ensure /etc/shadow password fields are not empty (Scored)

output=$(awk -F: '($2 == "" ) { print $1 " does not have a password "}' /etc/shadow)

if [[ -n $output ]]; then
    exit 1
else
    exit 0
fi
