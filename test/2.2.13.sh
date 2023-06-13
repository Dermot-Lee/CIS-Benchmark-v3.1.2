#!/bin/sh
# ** AUTO GENERATED **

# 2.2.13 - Ensure net-snmp is not installed (Scored)

output=$(rpm -q net-snmp)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
