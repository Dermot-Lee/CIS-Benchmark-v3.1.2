#!/bin/sh
# ** AUTO GENERATED **

# 2.2.11 - Ensure Samba is not installed (Scored)

output=$(rpm -q samba)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
