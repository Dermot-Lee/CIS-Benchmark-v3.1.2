#!/bin/sh
# ** AUTO GENERATED **

# 5.7 - Ensure access to the su command is restricted (Scored)

grep pam_wheel.so /etc/pam.d/su | grep -Pi '^\h*auth\h+(?:required|requisite)\h+pam_wheel\.so\h+(?:[^#\n\r]+\h+)?((?!\2)(use_uid\b|group=\H+\b))\h+(?:[^#\n\r]+\h+)?((?!\1)(use_uid\b|group=\H+\b))(\h+.*)?$' || exit $?
