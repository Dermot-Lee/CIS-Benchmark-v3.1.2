#!/bin/sh
# ** AUTO GENERATED **

# 5.2.15 - Ensure SSH warning banner is configured (Scored)

if [[ $(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep banner) == "banner /etc/issue.net" ]]; then
  exit 0
else
  exit 1
fi
