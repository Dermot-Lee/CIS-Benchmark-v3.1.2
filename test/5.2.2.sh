#!/bin/bash
# ** AUTO GENERATED **

# 5.2.2 - Ensure sudo commands use pty (Scored)

# Check if /etc/sudoers exists and if so, grep for "Defaults use_pty"
if [ -e /etc/sudoers ]; then
    sudoers_output=$(grep -Ei '^\s*Defaults\s+([^#]\S+,\s*)?use_pty\b' /etc/sudoers)
    if [[ $sudoers_output == *"Defaults use_pty"* ]]; then
        exit 0
    fi
fi

# Check each file in /etc/sudoers.d/ (if it exists and is not empty)
if [ -d /etc/sudoers.d ] && [ -n "$(ls -A /etc/sudoers.d)" ]; then
    for file in /etc/sudoers.d/*; do
        if [ -e "$file" ]; then
            file_output=$(grep -Ei '^\s*Defaults\s+([^#]\S+,\s*)?use_pty\b' "$file")
            if [[ $file_output == *"Defaults use_pty"* ]]; then
                exit 0
            fi
        fi
    done
fi

exit 1

