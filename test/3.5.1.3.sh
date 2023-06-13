#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.3 - Ensure nftables either not installed or masked with firewalld (Not Scored)

output=$(rpm -q nftables)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
