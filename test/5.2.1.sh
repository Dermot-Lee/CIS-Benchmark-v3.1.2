#!/bin/bash
# ** AUTO GENERATED **

# 5.2.1 - Ensure sudo is installed (Scored)

output=$(rpm -q sudo)

if [[ $output =~ "sudo-" ]]; then
    exit 0
else
    echo "$output"
    exit 1
fi
