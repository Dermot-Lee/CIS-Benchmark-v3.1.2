#!/bin/sh
# ** AUTO GENERATED **

# 1.1.18 - Ensure nodev option set on removable media partitions (Not Scored)

findmnt /home | grep -Ev '\bnodev\b' || exit $?
