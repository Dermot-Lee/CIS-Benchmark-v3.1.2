#!/bin/sh
# ** AUTO GENERATED **

# 2.2.12 - Ensure HTTP Proxy Server is not installed (Scored)

output=$(rpm -q squid)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
