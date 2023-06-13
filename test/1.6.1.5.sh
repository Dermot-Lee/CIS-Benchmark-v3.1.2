#!/bin/sh
# ** AUTO GENERATED **

# 1.6.1.5 - Ensure the SELinux mode is enforcing (Scored)

getenforce | grep "Enforcing" || exit $1
