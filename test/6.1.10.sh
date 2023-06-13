#!/bin/bash
# This script will return 0 if no world writable files exist, and 1 otherwise.

# Searching local filesystems
files=$(df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type f -perm -0002)

if [[ -z "$files" ]]; then
    # No world writable files found
    exit 0
else
    # World writable files found
    exit 1
fi

