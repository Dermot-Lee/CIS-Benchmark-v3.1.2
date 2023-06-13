#!/bin/bash
# ** AUTO GENERATED **

# 6.2.13 - Ensure users' home directories permissions are 750 or more restrictive (Scored)

while read -r user dir; do
  if [ ! -d "$dir" ]; then
    exit 1
  else
    dirperm=$(stat -L -c "%A" "$dir")
    if [ "$(echo "$dirperm" | cut -c6)" != "-" ] || [ "$(echo "$dirperm" | cut -c8)" != "-" ] || [ "$(echo "$dirperm" | cut -c9)" != "-" ] || [ "$(echo "$dirperm" | cut -c10)" != "-" ]; then
      exit 1
    fi
  fi
done < <(awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) {print $1 " " $6}' /etc/passwd)

exit 0
