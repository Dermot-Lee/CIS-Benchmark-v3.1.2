#!/bin/bash
# ** AUTO GENERATED **

# 5.5.2 - Ensure system accounts are secured (Not Scored)

# Run the first command and verify no results are returned
output1=$(awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' && $7!="'"$(which nologin)"'" && $7!="/bin/false") {print}' /etc/passwd)

if [[ -n $output1 ]]; then
    exit 1
fi

# Run the second command and verify no results are returned
output2=$(awk -F: '($1!="root" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"') {print $1}' /etc/passwd | xargs -I '{}' passwd -S '{}' | awk '($2!="L" && $2!="LK") {print $1}')

if [[ -n $output2 ]]; then
    exit 1
fi

exit 0

