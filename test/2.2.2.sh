#!/bin/bash
# ** AUTO GENERATED **

# 2.2.2 - Ensure X11 Server components are not installed (Scored)

if [ -n "$(rpm -qa xorg-x11-server*)" ]; then
    exit 1
else
    exit 0
fi

