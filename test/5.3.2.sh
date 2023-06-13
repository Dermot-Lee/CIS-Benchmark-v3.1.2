#!/bin/bash
# ** AUTO GENERATED **

# 5.3.2 - Ensure permissions on SSH private host key files are configured (Scored)

# Get a list of all 'ssh_host_*_key' files in /etc/ssh
files=$(find /etc/ssh -xdev -type f -name 'ssh_host_*_key')

# For each file, check the Uid, Gid, and permissions
for file in $files; do
    # Get the Uid and Gid
    uid=$(stat -c "%u" "$file")
    gid=$(stat -c "%g" "$file")

    # Get the permissions
    perms=$(stat -c "%a" "$file")

    # If Uid or Gid is not 0, or if permissions are not 0600 or more restrictive, exit 1
    if [[ $uid != 0 ]] || [[ $gid != 0 ]] || [[ $perms -gt 600 ]]; then
        exit 1
    fi
done

# If we made it here, all files passed the check
exit 0

