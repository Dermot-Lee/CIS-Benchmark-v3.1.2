#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.2.2 - Ensure iptables outbound and established connections are configured (Manual)

modprobe -n -v rds | grep -E "(install /bin/true|FATAL: Module rds not found.)" || exit $?
