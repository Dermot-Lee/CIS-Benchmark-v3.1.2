#!/bin/sh
# ** AUTO GENERATED **

# 1.1.19 - Ensure nosuid option set on removable media partitions (Not Scored)

for rmpo in $(lsblk -o RM,MOUNTPOINT | awk -F " " '/1/ {print $2}'); do 
 findmnt -n "$rmpo" | grep -Ev "\bnoexec\b"
done||exit $?
