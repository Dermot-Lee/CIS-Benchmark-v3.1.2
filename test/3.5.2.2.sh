#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.2 - Ensure firewalld is either not installed or masked with nftables (Not Scored)

output=$(rpm -q firewalld)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi