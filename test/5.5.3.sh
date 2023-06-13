#!/bin/bash
# ** AUTO GENERATED **

# 5.5 - Ensure default group for the root account is GID 0 (Not Scored)

# Step 1
output1=$(grep "^root:" /etc/passwd | cut -f4 -d:)

if [[ $output1 != "0" ]]; then
    exit 1
else
	exit 0
fi


