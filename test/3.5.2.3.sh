#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.3 - Ensure iptables-services not installed with nftables (Not Scored)

output=$(rpm -q iptables-services)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
