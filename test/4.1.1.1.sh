#!/bin/sh
# ** AUTO GENERATED **

# 4.1.1.1 - Ensure audit log storage size is configured (Not Scored)

output=$(rpm -q audit audit-libs)

if [[ $output == *"audit-"* ]] && [[ $output == *"audit-libs-"* ]]; then
    exit 0
else
    exit 1
fi
