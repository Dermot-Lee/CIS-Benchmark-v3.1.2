#!/bin/bash
# ** AUTO GENERATED **

# 4.1.1.2 - Ensure auditd service is enabled and running (Scored)

if [[ $(systemctl is-enabled auditd) == "enabled" ]] && $(systemctl status auditd | grep -q 'Active: active (running) '); then
    exit 0
else
    exit 1
fi
