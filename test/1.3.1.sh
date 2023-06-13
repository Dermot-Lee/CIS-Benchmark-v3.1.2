#!/bin/bash
# ** AUTO GENERATED **

# 1.3.1 - Ensure AIDE is installed (Scored)

# Check if AIDE is installed
output=$(rpm -q aide)

if [[ "$output" =~ "aide-" ]]; then
    exit 0
else
    exit 1
fi

