#!/bin/sh
# ** AUTO GENERATED **

# 2.2.18 - Ensure rpcbind is not installed or the rpcbind services are masked (Scored)

output=$(rpm -q rpcbind)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
