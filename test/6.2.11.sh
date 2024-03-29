#!/bin/sh
# ** AUTO GENERATED **

# 6.2.11 - Ensure all users' home directories exist (Scored)

cat /etc/passwd | egrep -v '^(root|halt|sync|shutdown)' | awk -F: '($7 != "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | while read user dir; do
   if [ ! -d "$dir" ]; then
      if [[ $1 -ne '' ]] ; then
         echo $dir;
         exit 1
      fi
      exit 0
   fi
done
