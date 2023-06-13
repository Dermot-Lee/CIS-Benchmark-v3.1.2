#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.2 - Ensure iptables-services not installed with firewalld (Not Scored)

output=$(rpm -q iptables-service)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi

