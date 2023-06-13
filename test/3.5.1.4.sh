#!/bin/bash
# ** AUTO GENERATED **

# 3.5.1.4 - Ensure firewalld service enabled and running (Not Scored)

if [[ $(systemctl is-enabled firewalld) == "enabled" ]] && [[ $(firewall-cmd --state) == "running" ]]; then
    exit 0
else
    exit 1
fi
