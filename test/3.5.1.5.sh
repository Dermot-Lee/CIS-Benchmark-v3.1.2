#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.5 - Ensure firewalld default zone is set (Not Scored)

if [ $(firewall-cmd --get-default-zone) == "public" ]; then
    exit 0
else
    exit 1
fi

