#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.1.2 - Ensure nftables is not installed with iptables (Not Scored)

output=$(rpm -q nftables)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
