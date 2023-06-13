#!/bin/bash
# ** AUTO GENERATED **

# 1.1.24 - Disable USB Storage (Scored)
# Check the modprobe configuration
modprobe_check=$(modprobe -n -v usb-storage)
if [[ "${modprobe_check%%[[:space:]]}" != "install /bin/true" ]]; then
  exit 1
fi

# Check if usb-storage module is loaded
lsmod_check=$( lsmod | grep -q "usb-storage" )

if [[ -n $lsmod_check ]]; then
  exit 1
fi
exit 0
