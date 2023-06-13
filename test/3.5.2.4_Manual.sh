#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3 - Ensure iptables are flushed with nftables (Not Scored)

modprobe -n -v rds | grep -E "(install /bin/true|FATAL: Module rds not found.)" || exit $?
