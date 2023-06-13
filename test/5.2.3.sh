#!/bin/bash
# ** AUTO GENERATED **

# 5.2.3 - Ensure sudo log file exists (Scored)


# Check if /etc/sudoers exists and if so, grep for "Defaults logfile="
if [ -e /etc/sudoers ]; then
    sudoers_output=$(grep -Ei '^\s*Defaults\s+([^#;]+,\s*)?logfile\s*=\s*(")?[^#;]+(")?' /etc/sudoers)
    if [[ $sudoers_output == *"Defaults logfile="* ]]; then
        exit 0
    fi
fi

# Check each file in /etc/sudoers.d/ (if it exists and is not empty)
if [ -d /etc/sudoers.d ] && [ -n "$(ls -A /etc/sudoers.d)" ]; then
    for file in /etc/sudoers.d/*; do
        if [ -e "$file" ]; then
            file_output=$(grep -Ei '^\s*Defaults\s+([^#;]+,\s*)?logfile\s*=\s*(")?[^#;]+(")?' "$file")
            if [[ $file_output == *"Defaults logfile="* ]]; then
                exit 0
            fi
        fi
    done
fi

exit 1

