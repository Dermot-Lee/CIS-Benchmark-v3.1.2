#!/bin/sh
# ** AUTO GENERATED **

# 1.6.1.4 - Ensure the SELinux mode is enforcing or permissive (Scored)

rpm -q setroubleshoot | grep -E "package setroubleshoot is not installed" || exit $1
