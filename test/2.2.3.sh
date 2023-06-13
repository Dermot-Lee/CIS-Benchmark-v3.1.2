#!/bin/bash
# ** AUTO GENERATED **

# 2.2.3 - Ensure Avahi Server is not installed (Scored)

output=$(rpm -q avahi-autoipd avahi)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi

