#!/bin/bash
# ** AUTO GENERATED **

# 1.1.1.1 - Ensure mounting of cramfs filesystems is disabled (Scored)

(modprobe -n -v cramfs 2>&1 | grep -E "(install /bin/true|FATAL: Module cramfs not found.)") >/dev/null 2>&1 || exit 1
[[ -z "$(lsmod | grep cramfs)" ]] >/dev/null 2>&1 || exit 1
exit 0

